# UTxO Market Infrastructure Repository 
An extensive summary report and discussion of previous market venue related grants, known publications and open source projects on Cardano that bootstrap the minting, listing, swapping, farming or pooling of future carbon tokens.

![DApp](https://github.com/BlockCarbon/market/blob/main/media/utxoDapp.jpg)

**List of all open source projects used/quoted/studied:**

* ADA Anvil
* Anastasia Labs
* Charli3
* FluidTokens
* GeniusYield
* IAMX
* MeshJS
* MLabs
* MuesliSwap
* Niels Mündler
* NMKR
* Trust Level
* Sundae Labs


![x](http://i.imgur.com/tXSoThF.png)

[Please provide Feedback / propose collabs on X](https://twitter.com/carbonblock)


## Structure

We have considered a large body of work from previously funded teams on Project Catalyst, plus open source contributions from DEXes and popular protocols on Cardano. Most work that was created prior to Aiken language and the Vasil hard fork have been ruled out as the code is too difficult to port and does not represent significant efficiency improvements or costs savings versus creating from scratch, bearing in mind the unique characteristics of carbon tokenization like retirement and adjustment mechanisms.

### [1000012](./1000012_aikenPatterns)

**Anastasia Labs - Streamlining Development: A User-Friendly Smart Contract Library for Plutarch and Aiken Design Patterns & Efficiency**

This open source proposal by Anastasia Labs from Fund-10 deals with relatively advanced and specialized expert use cases to improve efficiency. It is targeted at expert Cardano developer to apply unintuitive but highly beneficial code improvements. Minting policies and redeemer indexing are applicable for carbon token on-chain registration so we have included this as it also helps deepen the understanding of Aiken which is likely to become the dominant smart contract language for real world assets.

### [1000107](./1000107_meshJSsdk)

**MeshJS SDK Operations: Supporting Open-Source Library Development, Developer Resources & Builder Community**

MeshJS is an incredibly useful open source project with libraries that offer a comprehensive stack to deploy on Cardano with ease. For BlockCarbon Market, this has been an top resource and this Fund-10 project added far more functionality, fixed issues and maintained the stack into the Conway Era. 

### [1000142](./1000142_opshin)

**OpShin Core - Developing Python Smart Contracts**

For BlockCarbon Market as an alternative to MeshJS and Typescript/Javascript off-chain deployment, or using Lucid if and when that is viable, OpShin unlocking Python is a very intuitive and popular language and has a growing web3 follower base. There are some disadvantages in the wallet integration as fewer open source APIs exist and the deployment code is not as secure as Typescript, but for demonstration purposes or testnet deployment it is fantastic, and it also has great potential to work in the carbon space where academic, AI and IoT interfaces are very often written in Python by scientists who are only or mostly familiar with Python.

### [1000178](./1000178_priceDiscoverySundae)

**Sundae Labs Automated Price Discovery**

Cardano-based decentralized platform for automated price discovery, enabling DAOs to conduct token sales with less volatility and improved liquidity.

While this is DAO tooling proposed in a dedicated Project Catalyst challenge for DAOs, the automated price discovery is highly useful for BlockCarbon Market's use as a hybrid market place and exchange, where a DAO-like organization between registry, minting projects, token holders and retirement or adjustment smart contracts may exist at the production stage.

On the flipside, its implementation with nix and cabal differ greatly from the main examples and prototyping using Aiken and MeshJS or OpShin and may only be applicable for experienced Cardano developers.

### [1000181](./1000181_aikenSundae)

**SundaeSwap Aiken Smart Contracts**

Catalyst project that migrates Sundaeswap from Plutus to Aiken, providing a practical Aiken adoption case study, sharing insights with the Cardano community, and spurring Aiken's growth. This project was extremely useful for BlockCarbon market and provides a useful blueprint for anyone adopting to the industry's increasing adoption of Aiken for its simple, clear structure and much steeper learning curve for developers new to Cardano.

### [1100022](./1100022_aikenMeshJS)

# Aiken Open-Source Smart Contract Library

Although limited in the provision of use case benchmarks, the quality and documentation of this project makes it a valuable addition to build intuition and basic validator scaffolding for the BlockCarbon Market. Collection of open-source smart contracts with Aiken including Workspace, Mesh TX builder components, and integrate them into the Mesh SDK library on Github - open and accessible to all.

### [1100024](./1100024_lucidOffChain)

**Anastasia Labs - Lucid Evolution: Redefining Off-Chain Transactions in Cardano**

Project goal is to ensure long-term clarity by consistent maintenance, address GitHub issues, create new pull requests, and upgrade Lucid to the latest CML versions for sustained effectiveness. This project introduces Lucid to Blockcarbon Market which used to be the go-to solution for JS/TS off-chain deployment, but continuity and maintenance of the project used to be an issue and we have primarily made us of MeshJS instead because of this. This project "fixes" this. It is also unique in the depth it deals with SanchoNet and Volatire features that will fully introduce liquid democracy after the Plomin Hard Fork end of January 2025.

### [1100025](./11100025_maestro)

**Anastasia Labs X Maestro - Plug ‘n Play 2.0**

Ready-to-deploy smart contract APIs to run composable and reusable contracts without worrying about on/off-chain code. Get access to a library of open-source contracts and unleash your imagination. This project was mainly used in BlockCarbon market to provide intuition and best practise benchmarking for Peer-to-Peer trading.

### [1100028](./1100028_anvilWalletConnector)

**Anvil - Open Source - Universal Wallet Connector**

Open-source universal wallet connector, a one-stop shop to access all verified Cardano wallets, the Wallet Normalization Library. Making wallet connections seamless and easy. Useful for its core component, the Wallet Normalization Library which comprises a GitHub repository dedicated to an open-source universal wallet connector, encompassing the most popular Cardano wallets. The most popular Cardano wallets are integrated into the Wallet Normalization Library from launch, while any new or lesser-known wallets will be able to submit a pull request to be included in the integration list. This is a highly useful project for BlockCarbon Market as it allows to connect many popular Cardano wallet into a React environment as used by us for the exchange prototype.

### [1100033](./1100033_fluidBaFin)

**BaFin Audited Cardano Smart Contract for compliant Real World Asset Tokenization by NMKR, FluidTokens & IAMX**

BaFin audited Cardano SC, ensuring it meets eWpG standards. This aligns Cardano with EU laws, enhancing its legal validity for token ownership & more. This is very useful for BlockCarbon Market as it provides a much higher level of dApp legal trust in Estonia for the exchange and Germany for onboarded use cases as well as all other EU countries where the token issuer may reside.

### [1100093](./1100093_charli3DEXsdk)

**CHARLI3 - Open Source Multi-DEX SDK: A Pythonic Gateway to Decentralized Exchanges on Cardano**

Open-source Python SDK to facilitate seamless interaction with multiple Cardano DEXs, enabling easy integration for Python developers. Showcase for pythonic decentralized exchange dApp integration, that serves as a useful showcase for hybrid exchanges like BlockCarbon Market with the input of smart contract specialists at Mlabs and Metalamp.

### [1100243](./1100243_NMKRstudio)

# Real World Asset Tokenization Minting Capabilities in NMKR Studio

Enhancement of NMKR Studio's minting capabilities to enable seamless templatized minting of real-world assets, including fungible tokens, and to facilitate the issuance of new real-world assets. NMKR Studio is partially open-sourced and will be "further open sourced in the future". This makes the usability of the code inside BlockCarbon Market difficult, but the project offers valuable insights into RWA token minting on Cardano.
