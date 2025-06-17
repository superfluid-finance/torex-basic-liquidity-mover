# Uniswap Basic Liquidity Mover for TOREX

This repository contains the implementation of a basic liquidity mover for TOREX, which is easily automatable with
Gelato.

There is a draft TDD for this project [here](TDD.md).

This repository is based on the [Foundry Template by Paul Razvan Berg](https://github.com/PaulRBerg/foundry-template/).

## How To Use With Gelato

1. Deploy the contract or find an already deployed one.
2. Go to [Gelato App](https://app.gelato.network/).
3. Connect your wallet.
4. Start creating a new task by clicking on "+ Create Task".
5. For "Trigger type", select "Time Interval" and set the desired time interval.
6. For "What to trigger", select "Transaction".
7. For "Target Smart Contract", select the network and enter the address of the deployed contract.
8. For "Function to be automated", select
   `moveLiquidity(address: torex, address: rewardAddress, uint256: rewardAmountMinimum)`
9. Arguments:
   - `torex`: The address of the TOREX you want to move liquidity for.
   - `rewardAddress`: The address for which the profit of the liquidity movement is sent.
   - `rewardAmountMinimum`: The minimum amount of reward to be made in the quote tokens. Do account for gas cost so the
     reward amount would cover it.
10. For "Task Properties", give the task a name.
11. Create the task by clicking on "Create Task" and signing the transaction.
12. Check that the task shows up in your dashboard and you should be done.

Do note that for automation transactions to be executed by Gelato, you need to your fund Gelato account by going to
"1Balance" in the app, once you've connected your wallet.

## Deployments

### 2024-08-26
- Celo: https://celoscan.io/address/0x83bf283857c787923e7271a0bafdb44228688be0
- Optimism: https://optimistic.etherscan.io/address/0xb2c22f1a0dddb6222dae2f29269c703d3b76ac3b
- Base: https://basescan.org/address/0x1e77916e3fed4a24dc4e37968587e2b71d3a9c06

### 2024-07-11

- https://basescan.org/address/0x06f38def746ad22417940f580858ab36b2e6614c
- https://optimistic.etherscan.io/address/0xb32d94537591a899b13f7923a0f2cd0200a1ca84
- https://celoscan.io/address/0x8B25D8a48d1FB17C9aF7765c797CA38B78614729

### 2025-06-17

- https://www.arbiscan.io/address/0x5D0acD0864Ad07ba4E1E0474AE69Da87482e14A9

## License

This project is licensed under MIT.
