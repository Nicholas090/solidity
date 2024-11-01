// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MyContract {
    address otherContract;

    constructor(address _otherContract) {
        otherContract = _otherContract;
    }

    function callReceive() external payable {
        (bool success, ) = otherContract.call{value: msg.value}("");

        require(success, "can't send money");
    }

    function callSetName(string calldata _name) external {
                (bool success, bytes memory response) = otherContract.call(
                    abi.encodeWithSignature("setName(string)", _name)
                );
    }
}

contract AnotherContract {
    string public name;
    mapping(address => uint256) public balances;

    function setName(string calldata _name) external returns (bool) {
        name = _name;
        return true;
    }
}
