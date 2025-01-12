# Anastasia Labs - Streamlining Development: A User-Friendly Smart Contract Library for Plutarch and Aiken Design Patterns & Efficiency

This open source proposal by Anastasia Labs from Fund-10 deals with relatively advanced and specialized expert use cases to improve efficiency. It is targeted at expert Cardano developer to apply unintuitive but highly beneficial code improvements. Minting policies and redeemer indexing are applicable for carbon token on-chain registration so we have included this as it also helps deepen the understanding of Aiken which is likely to become the dominant smart contract language for real world assets.

[Design Patterns Github Repo](https://github.com/Anastasia-Labs/design-patterns)

Two wrapper libraries for Plutarch and Aiken smart contracts, that streamline development by abstracting unintuitive design patterns.

[Team Email](info@anastasialabs.com)

Project is fully open source.

Two smart contract libraries (to support Plutarch and Aiken) to abstract away unintuitive design patterns that even some of the best developers in the ecosystem don't know (because of how bizarre they are). *This aspect makes the project less suitable for a carbon token marketplace, as we do not necessarily want performance gains from bizarreness but rather clarity and interoperability. Nonetheless, there is little else yet in terms of design patterns for Aiken, and this is a fantastic resource to deepen your understanding about its validator scripts at work.*

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
