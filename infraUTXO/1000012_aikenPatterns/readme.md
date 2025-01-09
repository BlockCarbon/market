# Anastasia Labs - Streamlining Development: A User-Friendly Smart Contract Library for Plutarch and Aiken Design Patterns & Efficiency

[Design Patterns Github Repo](https://github.com/Anastasia-Labs/design-patterns)

Two wrapper libraries for Plutarch and Aiken smart contracts, that streamline development by abstracting unintuitive design patterns.

[Team Email](info@anastasialabs.com)

Project is fully open source.

Two smart contract libraries (to support Plutarch and Aiken) to abstract away unintuitive design patterns that even some of the best developers in the ecosystem don't know (because of how bizarre they are).

This includes:

* Transaction level validation for spending validators via stake validators using the withdraw zero trick.
* Transaction level validation for spending validators via minting policies.
* Input/output indexing with redeemers.
* Strict && validation checks
* PlutusTypeEnum Redeemers - efficient data encoding for simple redeemers as Enums.
* Normalize txInfoMint to get rid of 0 lovelace value.
* Normalize Validity Range.

To individually understand what is happening in each test it would be advisable to refer to the main [repository](https://github.com/Anastasia-Labs/design-patterns). Anastasia Labs explain each concept from a high level overview for better understanding of these patterns

Link to documentation [PDF](https://drive.google.com/file/d/1Oju4cMF7jrIjh5VbIueTyp45T45g1159/view?usp=sharing)
