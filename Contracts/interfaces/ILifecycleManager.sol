// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.24;

/// @title ILifecycleManager
/// @notice Interface for Confidential Business Lifecycle Management.

interface ILifecycleManager {

    enum LifecycleStage {

        Created,

        PolicyVerification,

        RightsEvaluation,

        PendingApproval,

        Active,

        Monitoring,

        Repayment,

        Released,

        Defaulted,

        Liquidated
    }

    function createLifecycle(

        uint256 lifecycleId,

        bytes32 confidentialHandle

    ) external;

    function verifyLifecycle(

        uint256 lifecycleId

    ) external;

    function updateStage(

        uint256 lifecycleId,

        LifecycleStage stage

    ) external;

    function releaseCollateral(

        uint256 lifecycleId

    ) external;

    function liquidate(

        uint256 lifecycleId

    ) external;

}
