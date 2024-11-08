// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MyContract {
    add
    address otherContract;
    event Response(string);

    constructor(address _otherContract) {
        otherContract = _otherContract;
        owner = msg.sender;
    }

    function callReceive() external payable {
        (bool success, ) = otherContract.call{value: msg.value}("");

        require(success, "can't send money");
    }

    function callSetName(string calldata _name) external {
                (bool success, bytes memory response) = otherContract.call(
                    // abi.encodeWithSignature("setName(string)", _name)
                    abi.encodeWithSelector(AnotherContract.setName.selector, _name)
                );
                emit Response(abi.decode(response, (string)));
    }
}

contract AnotherContract {
    string public name;
    mapping(address => uint256) public balances;

    function setName(string calldata _name) external returns (string memory) {
        name = _name;
        return name;
    }
}
