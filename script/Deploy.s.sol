// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.15;

import { ISETH } from "@superfluid-finance/ethereum-contracts/contracts/interfaces/tokens/ISETH.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { IUniswapSwapRouter } from "../src/ILiquidityMover.sol";

import { SwapRouter02LiquidityMover } from "../src/SwapRouter02LiquidityMover.sol";

import { BaseScript } from "./Base.s.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract Deploy is BaseScript {
    struct Config {
        IUniswapSwapRouter swapRouter02;
        ISETH seth;
        IERC20 erc20eth;
    }

    function run() public broadcast returns (SwapRouter02LiquidityMover liquidityMover) {
        Config memory config = getConfig(block.chainid);
        liquidityMover = new SwapRouter02LiquidityMover(config.swapRouter02, config.seth, config.erc20eth);
    }

    function getConfig(uint256 chainid) public pure returns (Config memory deployConfig) {
        if (chainid == 8453) {
            // Base
            deployConfig = Config({
                swapRouter02: IUniswapSwapRouter(0x2626664c2603336E57B271c5C0b26F421741e481),
                seth: ISETH(0x46fd5cfB4c12D87acD3a13e92BAa53240C661D93),
                erc20eth: IERC20(address(0))
            });
        } else if (chainid == 10) {
            // OP Mainnet
            deployConfig = Config({
                swapRouter02: IUniswapSwapRouter(0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45),
                seth: ISETH(0x4ac8bD1bDaE47beeF2D1c6Aa62229509b962Aa0d),
                erc20eth: IERC20(address(0))
            });
        } else if (chainid == 42_220) {
            // Celo
            deployConfig = Config({
                swapRouter02: IUniswapSwapRouter(0x5615CDAb10dc425a742d643d949a7F474C01abc4),
                seth: ISETH(0x671425Ae1f272Bc6F79beC3ed5C4b00e9c628240),
                erc20eth: IERC20(0x471EcE3750Da237f93B8E339c536989b8978a438)
            });
        } else if (chainid == 42_161) {
            // Arbitrum
            deployConfig = Config({
                swapRouter02: IUniswapSwapRouter(0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45),
                seth: ISETH(0xe6C8d111337D0052b9D88BF5d7D55B7f8385ACd3),
                erc20eth: IERC20(address(0))
            });
        } else {
            revert("Deploy config not available for given network.");
        }
    }
}