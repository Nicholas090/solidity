contract DelegateContract {
    address otherContract;

    constructor(address _otherContract) {
        otherContract = _otherContract;
    }

    function delegateCallGetDate() external payable  {
        (bool success, ) = otherContract.delegatecall(
            abi.encodeWithSelector(AnotherContract.getDate.selector)
        );

        require(success, "failed");
    }
}


contract AnotherContract {
    event Received(address sender, uint value);

    function getDate() external payable  {
        emit Received(msg.sender, msg.value);
    }
}
