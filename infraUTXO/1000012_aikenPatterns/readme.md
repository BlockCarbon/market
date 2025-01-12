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

[Aiken DesignPattern](https://github.com/Anastasia-Labs/aiken-design-patterns)

This work is also useful through the security vulnerabilities discussed within it:

### Oracle PK Attack
Oracle system are prone to attacks as their Cryptographic keys could be very valuable for the token staked to guarantee price feeds.
List of potential mitigation measured:
* On-chain system allowing key revoking/expiry/updating (perhaps a script which issues a single-use permission-token)
* multi-sig (hard to automate this)
* A more robust oracle ecosystem (as of yet non-existent on Cardano)

### Oracle Price Manipulation
See article for an instance of this with Compound. An attacker was able to manipulate Coinbases oracle to report a price which caused liquidations in Compound.
Mitigations:
* Time weighted averages
* Max/Min reportable price change (can be useful for stablecoins, may be less useful for generic price information for e.g. lending platforms)
* Consuming price information from many oracle sources - Coinbase, Binance, Coingecko, DEXes, etc.
* Chainlink or similar (Compound now uses chainlink since the oracle attack)

### Infinite Mint
This is an attack vector where an attacker finds unexpected ways to mint all kinds of tokens without the correct authorization. Below describes just one potential attack:
  1. We have a forwarding minting policy which requires MyState datum/token from the MyValidator Validator in order to perform a mint. This policy mints $TOK - this can be any fungible token/ token with a consistent currencysymbol.
  2. We Intend for users to mint using the MintTOK Redeemer in MyValidator, however, for other integrations we have a WitnessMyState Redeemer, which lets you consume MyState for any arbitrary purpose so long as you don't change it.
  3. If WitnessMyState does not check for minting actions, then we can mint infinite $TOK, inflating its value and potentially other catastrophic ruin-your-day kinds of exploits.
  4. 
### Parameterization
This isn't a vulnerability, but is more so an oversight that can lead to vulnerabilities that should be obvious. On-chain, it is highly non-trivial (module crypto magic) to check that a script is an instantiation of some parameterized script. Off-chain, this is less true, but even then, you have to be careful that you instantiate the script manually using the Apply constructor of UPLC. That way, you can off-chain match on that, and check that the LHS is the parameterized script, then the RHS is the parameter itself.

** Solution**

Use technique described above (i.e. manually constructing the term) for off-chain purposes. If you need to witness it on-chain, use a ZKP or don't parameterize your script.
Another solution is to store the "parameters" of your contract in an authenticated (and potentially unique) UTxO. However, note that this approach leads to identical addresses for different parameters.
In general, keep in mind that assuming a contract is instantiated properly, is equivalent to supporting arbitrary contracts, since this kind of validation is not yet possible.


### Imports and Usage

~~~
git clone https://github.com/Anastasia-Labs/aiken-design-patterns
cd aiken-design-patterns
~~~

All design patterns:

~~~
use aiken_design_patterns/merkelized_validator
use aiken_design_patterns/multi_utxo_indexer
use aiken_design_patterns/multi_utxo_indexer_one_to_many
use aiken_design_patterns/linked_list/ordered
use aiken_design_patterns/linked_list/unordered
use aiken_design_patterns/parameter_validation
use aiken_design_patterns/singular_utxo_indexer
use aiken_design_patterns/singular_utxo_indexer_one_to_many
use aiken_design_patterns/stake_validator
use aiken_design_patterns/tx_level_minter
~~~
