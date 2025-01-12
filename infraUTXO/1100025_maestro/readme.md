# Anastasia Labs X Maestro - Plug ‘n Play 2.0

Ready-to-deploy smart contract APIs to run composable and reusable contracts without worrying about on/off-chain code. Get access to a library of open-source contracts and unleash your imagination.

[Open source repository](https://github.com/Anastasia-Labs/plug-n-play-contracts)

This project was mainly used in the **BlockCarbon market** to provide intuition and best practise benchmarking for [Peer-to-Peer trading](https://github.com/Anastasia-Labs/direct-offer-offchain)

* Comprehensive design document outlining the structure, components, and functionalities of the Offchain SDKs tailored to the specified multisig contracts and subscription payments smart contract.
* Codebase of the implemented Offchain SDKs, organized according to the design specifications outlined in the design document.
* Documentation detailing the usage and integration of the SDKs with common development environments and languages.
* Test cases and results demonstrating rigorous testing conducted on the SDKs to ensure their reliability and effectiveness.

```typescript
import {
  MakeOfferConfig,
  makeOffer
} from "@anastasia-labs/direct-offer-offchain";

const makeOfferConfig: MakeOfferConfig = {
  offer: {
    ["lovelace"]: 10_000_000n
  },
  toBuy: {
    [toUnit("e16c2dc8ae937e8d3790c7fd7168d7b994621ba14ca11415f39fed72",
    "4d494e")]: 10_000n,
  },
  scripts: offerScripts,
};

const makeOfferUnSigned = await makeOffer(lucid, makeOfferConfig);

if (makeOfferUnSigned.type == "ok") {
  const makeOfferSigned = await makeOfferUnSigned.data.sign().complete();
  const makeOfferHash = await makeOfferSigned.submit();
  await lucid.awaitTx(makeOfferHash);
  console.log(`Made offer: ${makeOfferHash}`)
}
```
