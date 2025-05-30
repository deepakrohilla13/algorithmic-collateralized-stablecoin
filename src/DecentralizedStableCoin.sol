// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

// import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Decentralized Stable Coin (DSC)
 * @dev This contract implements a decentralized stable coin that is pegged to a fiat currency.
 * This contract is meant to be governed by DSCEngine as explained by original author Patrick Collins in his YouTube video.
 * This contract is a ERC20 token.
 * It allows users to mint and burn stable coins, and it maintains its peg through a collateralization mechanism.
 * The contract is designed to be fully decentralized, with no central authority controlling the supply or value of the stable coin.
 * The stable coin can be used for various purposes, including payments, remittances, and as a store of value.
 * @author Deepak Rohila
 * @notice This contract is for educational purposes only and should not be used in production without thorough testing and security audits.
 * @dev The contract is designed to be modular and extensible, allowing for future upgrades and improvements.
 * @custom:security-contact
 */
contract DecentralizedStableCoin is ERC20Burnable, Ownable {
    error DecentralizedStableCoin__MustBeMoreThanZero();
    error DecentralizedStableCoin__BurnAmountExceedsBalance();
    error DecentralizedStableCoin__NotZeroAddress();

    constructor() ERC20("DecentralizedStableCoin", "DSC") {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }
        if (balance < _amount) {
            revert DecentralizedStableCoin__BurnAmountExceedsBalance();
        }
        super.burn(_amount);
    }

    function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DecentralizedStableCoin__NotZeroAddress();
        }
        if (_amount <= 0) {
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
