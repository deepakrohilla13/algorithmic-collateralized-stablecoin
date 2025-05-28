// SPDX-License-Identifier: MIT
// SPDX-Identifier: MIT

pragma solidity ^0.8.18;
import {DecentralizedStableCoin} from "./DecentralizedStableCoin.sol";

/**
 * @title DSCEngine
 * @dev This system is designed to be as minimal as possible, and have the tokens maintain a 1token = 1USD peg.
 * This stablecoin has the properties:
 * - Exogenous Collateral
 * - Dollar Pegged
 * - Algoritmically Stable
 *
 * It is similar to DAI if DAI had no governance, no fees, and was only backed by WETH and WBTC.
 * DSC should always be "overcollateralized". At no point should the value of the collateral be less than the value of the DSC in circulation.
 * @author Deepak Rohila
 * @notice This contract is the core of the DSC System. It handles all the logic for mining and redemming DSC, as well as depositing & withdrawing collateral.
 * @notice This contract is very loosely based on the MakerDAO DSS (DAI) system.
 */
contract DSCEngine {
    ///////////////////////////////////////////
    ///////              Errors              ///////
    ///////////////////////////////////////////
    error DSCEngine__NeedMoreThanZero();
    error DSCEngine__TokenAddressAndPriceFeedAddressMustBeSameLength();
    //////////////////////////////////////////////////////////
    ///////              State Variables              ///////
    ///////////////////////////////////////////////////////////
    mapping(address token => address priceFeed) private s_priceFeeds;

    ///////////////////////////////////////////
    ///////              Modifiers              ///////
    ///////////////////////////////////////////
    modifier moreThanZero(uint256 amount) {
        if (amount <= 0) {
            revert DSCEngine__NeedMoreThanZero();
        }
        // Placeholder for owner check
        _;
    }

    ///////////////////////////////////////////
    ///////              Functions              //////
    ///////////////////////////////////////////
    constructor(
        address[] memory tokenAddresses,
        address[] memory priceFeedAddresses,
        address dscAddress
    ) {
        if (tokenAddresses.length != priceFeedAddresses.length) {
            revert DSCEngine__TokenAddressAndPriceFeedAddressMustBeSameLength();
        }
        for (uint256 i = 0; i < tokenAddresses.length; i++) {
            s_priceFeeds[tokenAddresses[i]] = priceFeedAddresses[i];
        }
    }

    ////////////////////////////////////////////////////////
    ///////              External Functions              //////
    ////////////////////////////////////////////////////////
    function depositCollateralAndMintDsc() external {}

    function redemCollateralForDsc() external {}

    function burnDsc() external {}

    function liquidate() external {}

    function getHealthFactor() external view {}

    /**
     * @notice This function allows users to deposit collateral into the system.
     * @param tokenCollateralAddress The address of the collateral token contract.
     * @param amountCollateral The amount of collateral to deposit.
     */
    function depositCollateral(
        address tokenCollateralAddress,
        uint56 amountCollateral
    ) external moreThanZero(amountCollateral) {
        // Placeholder for deposit logic
    }

    function redeemCollateral() external {}

    function mintDsc() external {}
}
