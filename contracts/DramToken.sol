//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DramToken is ERC20, Ownable {
	constructor() ERC20("Dram", "AMD") {
		_mint(msg.sender, 1000 ether);
	}

	event Minted(address indexed _to, uint256 _amount);
	event Burned(address indexed _to, uint256 _amount);

	function mint(address _to, uint256 _amount) public onlyOwner {
		_mint(_to, _amount);
		emit Minted(_to, _amount);
	}

	function burn(address _to, uint256 _amount) public onlyOwner {
		_burn(_to, _amount);
		emit Burned(_to, _amount);
	}
}