pragma solidity ^0.5.0;

import "@openzeppelin/contracts-ethereum-package/contracts/GSN/GSNRecipient.sol";


import "./GSNMultiSigWallet.sol";

contract MultisAccount is GSNRecipient {
    GSNMultiSigWallet[] deployedWallets;

    function initialize() initializer public
    {
        GSNRecipient.initialize();
    }

    function createMultisigWallet(address[] memory _owners, uint _required) public returns (address)
    {
        GSNMultiSigWallet wallet = new GSNMultiSigWallet();
        wallet.initialize(_owners, _required);
        deployedWallets.push(wallet);

        return address(wallet);
    }

    function getDeployedWallets() public view returns(GSNMultiSigWallet[] memory) {
        return deployedWallets;
    }

    function acceptRelayedCall(address relay, address from, bytes calldata encodedFunction, uint256 transactionFee, uint256 gasPrice, uint256 gasLimit, uint256 nonce, bytes calldata approvalData, uint256 maxPossibleCharge) external view returns (uint256, bytes memory) {
        return (0, "");
    }

}