# Anvil - Open Source - Universal Wallet Connector

Open-source universal wallet connector, a one-stop shop to access all verified Cardano wallets, the Wallet Normalization Library. Making wallet connections seamless and easy.

Useful for its core component, the **Wallet Normalization Library** which comprises a [GitHub repository](https://github.com/Cardano-Forge/weld) dedicated to an open-source universal wallet connector, encompassing the most popular Cardano wallets. The most popular Cardano wallets are integrated into the Wallet Normalization Library from launch, while any new or lesser-known wallets will be able to submit a pull request to be included in the integration list.

This is a highly useful project for **Blockcarbon Market** as it allows to connect many popular Cardano wallet into a React environment as used by us for the exchange prototype.

```typescript
import { WeldProvider } from "@ada-anvil/weld/react";
import { App } from "./app";

export function Index() {
  return (
    <WeldProvider>
      <App />
    </WeldProvider>
  );
}
```

![Demo](https://github.com/BlockCarbon/market/blob/main/media/weldDemo.jpg)

*This tooling allows much more than the currently offered main wallet types like Nami, Eternl and Yoroi*

[Demo Video](https://www.youtube.com/watch?v=xiMTKhKTyUk)
