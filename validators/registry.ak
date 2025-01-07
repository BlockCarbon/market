use aiken/hash.{Blake2b_224, Hash}
use aiken/list
use aiken/transaction.{ScriptContext}
use aiken/transaction/credential.{VerificationKey}

// Types for our carbon registry

/// Project data stored in datum
type ProjectData {
  project_id: ByteArray,
  vintage_year: Int,
  quantity: Int,
  standard: Standard,
  project_type: ProjectType,
  country: ByteArray,
  // Note: Optional upgradeability features
}

/// Supported carbon credit standards
type Standard {
  Verra
  GoldStandard
  ICR
}

/// Types of carbon projects
type ProjectType {
  Forestry
  RenewableEnergy
  EnergyEfficiency
  Other
}

/// Datum structure for registry UTxOs
type RegistryDatum {
  owner: VerificationKeyHash,
  project: ProjectData,
  status: ProjectStatus,
}

/// Status of projects in registry
type ProjectStatus {
  Pending
  Verified
  Rejected
  Retired
}

/// Possible actions that can be performed
type RegistryAction {
  RegisterProject { project: ProjectData }
  VerifyProject
  RejectProject
  UpdateMetadata { new_data: ProjectData }
  RetireCredits { amount: Int }
}

/// Main registry validator
validator registry {
  fn validate(datum: RegistryDatum, redeemer: RegistryAction, ctx: ScriptContext) -> Bool {
    // Extract key information from context
    let ScriptContext { transaction, purpose } = ctx
    
    // Verify basic transaction structure
    expect Some(own_input) = transaction.find_input(purpose)
    expect Some(own_output) = transaction.find_own_output(ctx)
    
    // Match on action type
    when redeemer is {
      // New project registration
      RegisterProject { project } -> {
        // Ensure project ID is unique - would need to scan other outputs
        // TODO: Account model would use mappings, for UTxO we need different approach
        
        // Verify project data is valid
        validate_project_data(project) && 
          own_output.datum == RegistryDatum {
            owner: datum.owner,
            project: project,
            status: Pending,
          }
      }

      // Verify existing project
      VerifyProject -> {
        // Only registry owner can verify
        transaction.is_signed_by(datum.owner) &&
          datum.status == Pending &&
          own_output.datum == RegistryDatum {
            owner: datum.owner,
            project: datum.project,
            status: Verified,
          }
      }

      // Reject project
      RejectProject -> {
        // Only registry owner can reject
        transaction.is_signed_by(datum.owner) &&
          datum.status == Pending &&
          own_output.datum == RegistryDatum {
            owner: datum.owner,
            project: datum.project,
            status: Rejected,
          }
      }

      // Update project metadata
      UpdateMetadata { new_data } -> {
        // Only project owner can update
        transaction.is_signed_by(datum.owner) &&
          datum.status == Verified &&
          validate_project_data(new_data) &&
          own_output.datum == RegistryDatum {
            owner: datum.owner,
            project: new_data,
            status: datum.status,
          }
      }

      // Retire carbon credits
      RetireCredits { amount } -> {
        // Verify project is active and has sufficient credits
        datum.status == Verified &&
          amount <= datum.project.quantity &&
          own_output.datum == RegistryDatum {
            owner: datum.owner,
            project: ProjectData {
              ..datum.project,
              quantity: datum.project.quantity - amount,
            },
            status: datum.status,
          }
      }
    }
  }
}

// Helper function to validate project data
fn validate_project_data(project: ProjectData) -> Bool {
  // Implement validation rules for project data
  // This would include checks for:
  // - Valid vintage year
  // - Non-zero quantity
  // - Valid country code
  // etc.
  
  project.quantity > 0 &&
    project.vintage_year >= 2000 &&
    project.vintage_year <= 2100
}

// Note: The following features have been intentionally simplified or removed:
// 1. Upgradeability pattern - Cardano validators are immutable by design
// 2. Complex fee structure - Will be implemented in separate validator
// 3. ERC20 converter - Will be handled by native token minting policy
// 4. Certificate NFTs - Will be separate validator