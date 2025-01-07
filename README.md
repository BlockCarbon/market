# exchange
Development of hybrid market place technology for Cardano carbon credit tokenization.

We take a look at best practise industry carbon registry, token minting policy and retirement contracts and adjust them for the UTxO model and its advantages. Meant for discussion of progressive elements and testnet implementation as well as Python or Typescript deployment like [Opshin](https://github.com/OpShin/opshin), [MeshJS](https://meshjs.dev/).

# BlockCarbon Project Management Plan

## Overview
Total Hours: 550

## 1. Prototype Blueprint/Designs

### 1.1 Market Research & Requirements Analysis (30 hours)
- Market analysis of existing carbon credit platforms (8h)
- Stakeholder interviews and requirement gathering (12h)
- Competitive analysis of blockchain-based carbon markets (10h)

### 1.2 User Experience Design (40 hours)
- User journey mapping (8h)
- Information architecture design (12h)
- Wireframe development (12h)
- User flow diagrams (8h)

### 1.3 UI Design & Prototyping (50 hours)
- Design system development (15h)
- High-fidelity UI design (20h)
- Interactive prototype development (15h)

### 1.4 Technical Architecture Design (30 hours)
- System architecture documentation (10h)
- Integration points specification (10h)
- Technical feasibility assessment (10h)

## 2. Carbon Market Report & Token Whitepaper (150 hours)

### 2.1 Market Research (40 hours)
- Analysis of current carbon markets (15h)
- Review of post-Paris Agreement developments (10h)
- Assessment of blockchain carbon credit initiatives (15h)

### 2.2 Token Economics Design (35 hours)
- Token model development (15h)
- Economic incentive structure design (10h)
- Governance mechanism specification (10h)

### 2.3 Technical Specification (40 hours)
- Smart contract architecture (15h)
- Token standard specification (15h)
- Integration protocols definition (10h)

### 2.4 Documentation & Review (35 hours)
- Whitepaper drafting (20h)
- Peer review process (10h)
- Final revisions and formatting (5h)

## 3. UTxO Trading Infrastructure Report (100 hours)

### 3.1 Research Phase (40 hours)
- Analysis of Cardano Project Catalyst funds (10h)
- Review of DEX implementations (15h)
- Assessment of development tools & frameworks (15h)

### 3.2 Technical Analysis (35 hours)
- Smart contract pattern analysis (12h)
- Off-chain code assessment (12h)
- Infrastructure comparison (11h)

### 3.3 Documentation & Recommendations (25 hours)
- Best practices documentation (10h)
- Implementation guidelines (10h)
- Future development recommendations (5h)

## 4. Jurisdictional Analysis & Documentation (150 hours)

### 4.1 Legal Research (50 hours)
- Regulatory framework analysis by region (20h)
- KYC/AML requirement assessment (15h)
- Securities law compliance review (15h)

### 4.2 Market Structure Analysis (40 hours)
- Custodial services assessment (15h)
- Hybrid marketplace models evaluation (15h)
- Integration requirements analysis (10h)

### 4.3 Consultation & Expert Review (35 hours)
- Financial services expert consultation (15h)
- Legal expert review (10h)
- Technical compliance assessment (10h)

### 4.4 Documentation & Recommendations (25 hours)
- Jurisdictional guidelines documentation (10h)
- Implementation roadmap development (10h)
- Final recommendations compilation (5h)

## Risk Management

### Key Risks
1. Regulatory changes affecting carbon markets
2. Technical integration challenges
3. Stakeholder alignment issues
4. Market adoption uncertainties

### Mitigation Strategies
1. Regular regulatory monitoring and updates
2. Modular design approach
3. Stakeholder engagement plan
4. Phased implementation strategy

## Dependencies & Critical Path
1. Market research must complete before technical design
2. Legal framework understanding required for token design
3. Infrastructure analysis needed for marketplace design
4. Stakeholder feedback required for final recommendations

## Next Steps
1. Establish project team and roles
2. Set up project management infrastructure
3. Begin stakeholder engagement
4. Initiate market research phase


### Validator Design

Aiken validator for the carbon registry that:
    1. Defines core data structures for carbon projects 
    2. Implements main validation logic for: 
        ◦ Project registration 
        ◦ Verification 
        ◦ Updates 
        ◦ Retirement 
    3. Uses Cardano's eUTxO model instead of Solidity's account-based model 
    4. Documents removed functionality that will need separate implementation 
Key differences from the Solidity version:
    1. State management is handled through UTxOs rather than storage variables 
    2. Validation focuses on state transitions rather than direct mutations 
    3. Fee handling is separated into its own validator 
    4. Token functionality will be handled by native tokens



Token minting policy requirements:

    1. Controls the lifecycle of carbon credit tokens: 
        ◦ Initial minting for verified projects 
        ◦ Burning during retirement 
        ◦ Emergency freeze capability 
    2. Integrates with the registry validator by: 
        ◦ Verifying project status before minting 
        ◦ Checking quantities against registry records 
        ◦ Maintaining registry owner control 
    3. Implements key differences from the Solidity version: 
        ◦ Uses Cardano native tokens instead of ERC20 
        ◦ Implements direct burning rather than status flags 
        ◦ Leverages UTxO model for balance tracking

Retirement validator that:
    1. Implements a two-step retirement process: 
        ◦ Initial retirement creation with token burning 
        ◦ Confirmation with permanent transaction record 
    2. Stores comprehensive retirement data: 
        ◦ Beneficiary information 
        ◦ Retirement details and messages 
        ◦ Project references 
        ◦ Immutable proof of retirement 
    3. Provides safety mechanisms: 
        ◦ Pending state for verification 
        ◦ Emergency cancellation capability 
        ◦ Validation of token burning 
    4. Creates permanent on-chain records that: 
        ◦ Cannot be modified once confirmed 
        ◦ Link to the burning transaction 
        ◦ Maintain complete retirement history 

    1. Add more detailed retirement metadata handling 
    2. Implement batch retirement capabilities 
    3. Add fee calculation logic 
    4. Create the certificate NFT minting integration

~~~
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
~~~

### MeshJS or OpShin/Python Deploy Scripts
This basic Python script *deploy.py* can be used experimentally (Testnet only)

~~~
import subprocess
import sys
from web3 import Web3

def deploy_solidity_contract():
    # Connect to the blockchain
    w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:8545'))
    w3.eth.default_account = w3.eth.accounts[0]

    # Read the Solidity contract
    with open('BasicCarbonOffsets.sol', 'r') as file:
        contract_source_code = file.read()

    # Compile the contract
    compiled_sol = subprocess.run(['solc', '--combined-json', 'abi,bin', 'BasicCarbonOffsets.sol'], capture_output=True)
    compiled_sol = json.loads(compiled_sol.stdout)
    
    contract_id, contract_interface = compiled_sol.popitem()
    bytecode = contract_interface['bin']
    abi = contract_interface['abi']

    # Deploy the contract
    BasicCarbonOffsets = w3.eth.contract(abi=abi, bytecode=bytecode)
    tx_hash = BasicCarbonOffsets.constructor(1000000).transact()
    tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)

    print(f"Contract deployed at address: {tx_receipt.contractAddress}")

def deploy_move_contract():
    # Example command to compile and deploy Move contract using a CLI tool
    move_cli_command = "move-cli publish --address <your_address>"
    subprocess.run(move_cli_command, shell=True)

if __name__ == "__main__":
    if len(sys.argv) != 2 or sys.argv[1] not in ["solidity", "move"]:
        print("Usage: python deploy.py [solidity|move]")
        sys.exit(1)

    if sys.argv[1] == "solidity":
        deploy_solidity_contract()
    elif sys.argv[1] == "move":
        deploy_move_contract()
~~~

This script provides a simple way to deploy a carbon offset smart contract using either Aiken or another validator language by choice. It requires the user to adjust the CLI command based on the specific environment and setup. 

[List of Community-built Developer Tools](https://www.essentialcardano.io/article/a-list-of-community-built-developer-tools-on-cardano)

[Calling Endpoint via CLI](https://forum.cardano.org/t/how-can-i-call-endpoint-via-cardano-cli-transaction-build-command/111154)

### Getting started with MeshJS
To get started with Mesh, you need to install the latest version of Mesh with npm:

~~~
npm install @meshsdk/core @meshsdk/react
~~~

Below is an alternative deploy.js script written in TypeScript-compatible JavaScript. This script uses ethers.js for deploying the Solidity contract and an example command to deploy the universal smart contract.
Install the necessary dependencies:

`npm install ethers @types/node`

Use the deploy.ts script:

~~~
import { ethers } from 'ethers';
import { exec } from 'child_process';
import { promisify } from 'util';
import fs from 'fs';
import path from 'path';

const execAsync = promisify(exec);

async function deploySolidityContract() {
    // Connect to the blockchain
    const provider = new ethers.providers.JsonRpcProvider('http://127.0.0.1:8545');
    const signer = provider.getSigner();

    // Read the Solidity contract
    const contractPath = path.resolve(__dirname, 'BasicCarbonOffsets.sol');
    const contractSource = fs.readFileSync(contractPath, 'utf8');

    // Compile the contract
    const solc = require('solc');
    const input = {
        language: 'Solidity',
        sources: {
            'BasicCarbonOffsets.sol': {
                content: contractSource,
            },
        },
        settings: {
            outputSelection: {
                '*': {
                    '*': ['abi', 'evm.bytecode'],
                },
            },
        },
    };
    const output = JSON.parse(solc.compile(JSON.stringify(input)));
    const abi = output.contracts['BasicCarbonOffsets.sol']['BasicCarbonOffsets'].abi;
    const bytecode = output.contracts['BasicCarbonOffsets.sol']['BasicCarbonOffsets'].evm.bytecode.object;

    // Deploy the contract
    const factory = new ethers.ContractFactory(abi, bytecode, signer);
    const contract = await factory.deploy(1000000);

    console.log(`Contract deployed at address: ${contract.address}`);
}

async function deployMoveContract() {
    // Example command to compile and deploy Move contract using a CLI tool
    const moveCliCommand = 'move-cli publish --address <your_address>';
    const { stdout, stderr } = await execAsync(moveCliCommand);
    if (stderr) {
        console.error(`Error deploying Move contract: ${stderr}`);
    } else {
        console.log(`Move contract deployed: ${stdout}`);
    }
}

(async () => {
    const args = process.argv.slice(2);
    if (args.length !== 1 || (args[0] !== 'solidity' && args[0] !== 'move')) {
        console.error('Usage: ts-node deploy.ts [solidity|move]');
        process.exit(1);
    }

    if (args[0] === 'solidity') {
        await deploySolidityContract();
    } else if (args[0] === 'move') {
        await deployMoveContract();
    }
})();
~~~

Usage
To run this script, use ts-node, which allows you to execute TypeScript files directly. First, install ts-node if you haven't already:


`npm install -g ts-node`


`Run the script with:`


`ts-node deploy.ts [aiken]`


Replace [aiken] with other language depending on which contract you want to deploy.

This script reads, compiles, and deploys the smart contract using ethers.js and executes a command to deploy the Move contract using the CLI tool. Adjust the off-chain deployment command as necessary for your specific environment and setup.

[MeshJS](https://docs.meshjs.dev/classes/MeshWallet)

