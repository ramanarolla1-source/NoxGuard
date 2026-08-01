// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.24;

import "./IBusinessPolicy.sol";
import "./ILifecycleManager.sol";

/// @title INoxGuard
/// @notice Main interface for NoxGuard orchestration.

interface INoxGuard {

    function startLifecycle(

        uint256 policyId,

        uint256 lifecycleId,

        IBusinessPolicy.PolicyType policyType,

        bytes32 encryptedPolicyHandle

    ) external;

    function requestPolicyEvaluation(

        uint256 policyId

    ) external;

    function executeBusinessPolicy(

        uint256 policyId

    ) external;

    function advanceLifecycle(

        uint256 lifecycleId,

        ILifecycleManager.LifecycleStage stage

    ) external;

    function releaseCollateral(

        uint256 lifecycleId

    ) external;

    function confidentialLiquidation(

        uint256 lifecycleId

    ) external;

}
