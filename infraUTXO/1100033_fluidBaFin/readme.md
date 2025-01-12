# BaFin Audited Cardano Smart Contract for compliant Real World Asset Tokenization by NMKR, FluidTokens & IAMX

BaFin audited Cardano SC, ensuring it meets eWpG standards. This aligns Cardano with EU laws, enhancing its legal validity for token ownership & more;

This is very useful for **Blockcarbon Market** as it provides a much higher level of dApp legal trust in Estonia for the exchange and Germany for onboarded use cases as well as all other EU countries where the token issuer may reside.

[Open source repository](https://github.com/FluidTokens/fn-bafin-cardano-sc)

**How the SC works**

* Bafin Address can create a new issuer minting an NFT, specifying issuer's stakeCredentials and locking in issuer_manager.
* Bafin Address then can create a SecurityInfo minting an NFT, specifying issuer's stakeCredentials and locking in security_info.
* Issuer can then create a new admin minting an NFT, specifying admin's stakeCredentials and locking in admin_manager.
* Admin can then create a user state minting an NFT, specifying user's stakeCredentials and locking in a dedicated state_manager instance.
* Issuer can then create securities minting them in a dedicated transfer_manager instance.
* Bafin can remove an issuer changing stakeCredentials of his issuer utxo.
* Issuer can edit the security infos for the security_info utxos he controls.
* Issuer can remove an admin changing stakeCredentials of his admin utxo.
* Admin can freeze a user changing stakeCredentials of his state utxo.
* Admin can lock user's securities sending them in a utxo to locked_transfer_manager.
* Admin can lock user's securities and give them to anyone sending them in a utxo to transfer_manager.

