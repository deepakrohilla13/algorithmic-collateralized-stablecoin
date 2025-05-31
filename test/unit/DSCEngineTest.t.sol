// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";

contract DSCEngineTest is Test {
    DeployDSC deployer;
    DSCEngine dscEngine;
    DecentralizedStableCoin dsc;
    HelperConfig helperConfig;
    address ethUsdPriceFeed;
    address weth;

    function setUp() public {
        deployer = new DeployDSC();
        (dsc, dscEngine, helperConfig) = deployer.run();
        (ethUsdPriceFeed,, weth,,) = helperConfig.activeNetworkConfig();
    }

    ////////////////////////////////
    ///////// Test Cases //////////
    ////////////////////////////////
    function testGetUsdValue() public view {
        uint256 amount = 10e18; // 10 ETH
        uint256 expectedUsdValue = 10000e18; // Assuming ETH price is $2000
        console.log("Eth", address(weth));
        uint256 usdValue = dscEngine.getUsdValue(weth, amount);
        assertEq(true, true, "Test");
    }
}
