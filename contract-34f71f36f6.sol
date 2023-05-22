// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.8.3/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts@4.8.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.3/security/Pausable.sol";

/// @custom:security-contact misterx.us93@gmail.com
contract Rannamaari is ERC20, ERC20Snapshot, Ownable, Pausable {
    constructor() ERC20("Rannamaari", "RANNAMAARI") {
        _mint(msg.sender, 1000000000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
