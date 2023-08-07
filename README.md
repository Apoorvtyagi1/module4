# module4
# Degen Gaming ERC20 Token

Welcome to the Degen Gaming ERC20 Token repository! This smart contract provides essential functionality for Degen Gaming, including minting, transferring, redeeming, checking balances, and burning tokens.

## Contract Details

- *Token Name:* Degen Token
- *Token Symbol:* DGN

## Functions

1. *Minting New Tokens*: As the contract owner, you have the power to mint new tokens. Simply call the `mintcoins` function and specify the recipient's address and the desired token amount.

2. *Transferring Tokens*: Players can transfer their tokens to others effortlessly using the `tokenTransfer` function. Just provide the recipient's address and the token amount to be transferred.

3. *Redeeming Tokens*: Excitingly, players can redeem their tokens for exclusive in-game items from the in-game store. To do this, call the `redeemItems` function and specify the item to be redeemed. (Additional item redemption logic can be added to the contract.)

4. *Checking Token Balance*: Players can easily check their token balance at any time using the `balanceOf` function. Simply provide your account address to retrieve the balance.

5. *Burning Tokens*: Need to get rid of some tokens? No worries! Anyone can burn their own tokens by calling the `burncoins` function and specifying the amount to be burned.

## Deployment

To deploy the contract in your local development environment:

1. Write the contract using Remix or any Solidity development environment.
2. Add a network account on Metamask and ensure it has enough AVAX (Avalanche native currency).
3. Select the "Injected Provider" as the environment in Remix.
4. Deploy the contract using Metamask to interact with the Avalanche network.
5. To verify the contract's deployment, copy the contract address and paste it into "Snowtrace Fauji Testnet" or any other relevant platform for verification.

## Checking on Snowtrace Testnet
 Use these easy steps to check that the ERC20 token contract has been deployed on the Snowtrace Testnet:
1. Launch a web browser and go to the [Snowtrace](https://testnet.snowtrace.io/) page.
2. Enter the contract address you acquired from the Remix IDE when you deployed the contract in the search field on the Snowtrace explorer.
3. To get comprehensive information about the deployed ERC20 token contract, press Enter or click the search icon.
4. You will now have full access to the contract's information, including token balances, transactions, and other relevant data.

## License

The Degen Gaming ERC20 Token project is licensed under the MIT License. See the LICENSE file for more information.
