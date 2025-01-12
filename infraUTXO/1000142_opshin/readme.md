# OpShin Core - Developing Python Smart Contracts


As an alternative to MeshJS and Typescript/Javascript off-chain deployment, or using Lucid if and when that is viable, Python is a very intuitive and popular language and has a growing web3 follower base. There are some disadvantages in the wallet integration as fewer open source APIs exist and the deployment code is not as secure as Typescript, but for demonstration purposes or testnet deployment it is fantastic, and it also has great potential to work in the carbon space where academic, AI and IoT interfaces are very often written in Python by scientists who are only or mostly familiar with Python.

![Awesome](https://github.com/BlockCarbon/market/blob/main/media/awesome-opshin.png)

*Awesome OpShin library*

[Opshin Open Source repo](https://github.com/OpShin)

[Opshin Ledger API v2](https://github.com/OpShin/opshin/blob/main/opshin/ledger/api_v2.py)

Writing Smart Contracts on Cardano in Plutus/Haskell is difficult. Alternatives like OpShin (Python) are not well funded and currently have no dedicated developers pushing the project forward. By hiring a part time developer, the OpShin project can make progress in the desired pace such that it will truly enable onboarding of new developers into the ecosystem.

On-chain code doesn’t integrate smoothly with off-chain code

Whilst the on-chain part of a dApp handles the transactions on the blockchain, the off-chain part often handles the rest of the dApp. Developers are forced to use two completely separate tools, often in separate languages. This costs Focus - and introduces unnecessary friction at integration and potential security issues.

Instead of working on how to best solve a problem to serve your users’ needs, you’re pulling your hair trying to make the two halves of your dApp work together.

Smart Contract size is limited, and PlutusTx is hefty

Smart Contracts have tight constraints on size and execution steps. PlutusTx and other tools often translate type constraints to expensive and unnecessary on-chain transactions, limiting developers in the complexity of what they can build.

Instead of building the best solution possible, you’re hamstringing yourself just to make sure the most critical parts of your smart contract can be executed on the blockchain.

How OpShin frees you

The OpShin Toolchain comprises several projects that aim to facilitate the development of Smart Contracts and dApps on Cardano. They are largely based on Python, or integrate well with it for maximal accessibility.

Python has a wide and growing community

At the time of writing, Python is the second-most used language on GitHub, with 14.75% of the active userbase working with Python, and enjoys a 22.5% year-over-year increase in users; this is driven in part by its utility in data science and machine learning. 

The Catalyst proposal outlines three tasks for the OpShin core improvements. The third one covers simulation: The Plutus VM needs to be fully implemented in Python in order to give full freedom and flexibility when developing in a Python stack on Cardano. The current implementation is lacking precision and testing as well as primitives that will be present in Plutus V3.

A fully typesafe and cost-measuring implementation of the Plutus VM in Python.

Related issues include:

[Natively evaluate Tx in UPLC](https://github.com/OpShin/uplc/issues/12)
[Check types for builtins](https://github.com/OpShin/uplc/issues/4)

