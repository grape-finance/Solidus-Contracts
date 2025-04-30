// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

abstract contract YToken is ERC20Burnable {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    function maxTotalSupply() internal virtual view returns (uint256);
}

contract sSYNTH is YToken {
    uint256 public constant MAX_TOTAL_SUPPLY = 30_000_000 ether;

    constructor(
        string memory _name,
        string memory _symbol,
        address _devFund,
        address _treasuryFund,
        address _reserve
    ) YToken(_name, _symbol) {
        _mint(msg.sender, 1_000_000 ether);
        _mint(_devFund, 3_000_000 ether); 
        _mint(_treasuryFund, 3_000_000 ether); 
        _mint(_reserve, MAX_TOTAL_SUPPLY - 7_000_000 ether);
    }

    // ===== OVERRIDEN =============

    function maxTotalSupply() internal pure override returns (uint256) {
        return MAX_TOTAL_SUPPLY;
    }
}
