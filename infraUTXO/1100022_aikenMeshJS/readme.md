# Aiken Open-Source Smart Contract Library

Although limited in the provision of use case benchmarks, the quality and documentation of this project makes it a valuable addition to build intuition and basic validator scaffolding for the **BlockCarbon Market**. 

Collection of open-source smart contracts with Aiken including Workspace, Mesh TX builder components, and integrate them into the Mesh SDK library on Github - open and accessible to all.

[Open source repository](https://github.com/MeshJS/mesh/tree/main/packages/mesh-contract)

[Mint token and initiate swap](https://meshjs.dev/smart-contracts/swap#initiateSwap)


Implementation of a set of complex contracts showcasing advanced functionalities within the Aiken Open-Source Smart Contract Library.

* Smart Contract NFT Minting

* App Oracle Design Pattern

* Content ownership guide

Smart Contract Description:



Setup Oracle UTXO: Sends the NFT to the oracle contract locking the datum, which serves as single source of truth
Create Content Registry
Create Ownership registry
Get Oracle Data: Fetch the current state of the registry
Mint User Token: Mints token so user can create the content
Create content: Attaches the content to the registry
Get content: Fetches content data from the registry
* Smart Contract NFT Minting:
[Documentation](https://meshjs.dev/smart-contracts/plutus-nft)
[Oracle Design Pattern](https://github.com/MeshJS/mesh/tree/main/packages/mesh-contract/src/plutus-nft)


* Setup Oracle: Mint one-time minting policy to set up the oracle
* Mint Token: Mint NFT that ensures the token name is incremented by a counter
* Get Oracle Data: Fetch the current oracle data to get the current NFT index and other information
