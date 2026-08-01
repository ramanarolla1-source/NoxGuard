/**
 * ----------------------------------------------------------------------------
 *  NOXGUARD
 * ----------------------------------------------------------------------------
 *
 *  LifecycleManager.sol
 *
 *  Purpose
 *  -------
 *  Implements Confidential Business Lifecycle Management for institutional
 *  Solidity smart contracts.
 *
 *  Traditional smart contracts expose lifecycle decisions publicly.
 *  NoxGuard organizes lifecycle transitions while confidential policy
 *  evaluations are delegated to iExec Nox.
 *
 *  Responsibilities
 *  ----------------
 *  • Business Lifecycle State Management
 *  • Rights Evaluation
 *  • Policy Verification
 *  • Confidential State Transitions
 *  • Institutional Workflow Orchestration
 *
 *  NoxGuard determines WHEN a lifecycle transition occurs.
 *  iExec Nox determines HOW confidential evaluation is executed.
 *
 * ----------------------------------------------------------------------------
 */

pragma solidity ^0.8.24;

/// @title Lifecycle Manager
/// @author NoxGuard
/// @notice Reference implementation of Confidential Business Lifecycle Management.

contract LifecycleManager {

    /**
     * ------------------------------------------------------------------------
     * Business Lifecycle
     * ------------------------------------------------------------------------
     */

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

    /**
     * ------------------------------------------------------------------------
     * Lifecycle Record
     * ------------------------------------------------------------------------
     */

    struct Lifecycle {

        uint256 lifecycleId;

        LifecycleStage stage;

        bytes32 confidentialHandle;

        bool verifiedByNox;

        uint256 createdAt;

        uint256 updatedAt;
    }

    mapping(uint256 => Lifecycle) public lifecycles;

    /**
     * ------------------------------------------------------------------------
     * Events
     * ------------------------------------------------------------------------
     */

    event LifecycleCreated(
        uint256 indexed lifecycleId
    );

    event StageUpdated(
        uint256 indexed lifecycleId,
        LifecycleStage stage
    );

    event VerifiedByNox(
        uint256 indexed lifecycleId
    );

    /**
     * ------------------------------------------------------------------------
     * Create Lifecycle
     * ------------------------------------------------------------------------
     */

    function createLifecycle(

        uint256 lifecycleId,

        bytes32 confidentialHandle

    ) external {

        lifecycles[lifecycleId] = Lifecycle({

            lifecycleId: lifecycleId,

            stage: LifecycleStage.Created,

            confidentialHandle: confidentialHandle,

            verifiedByNox: false,

            createdAt: block.timestamp,

            updatedAt: block.timestamp
        });

        emit LifecycleCreated(lifecycleId);
    }

    /**
     * ------------------------------------------------------------------------
     * Confidential Policy Verification
     *
     * Evaluation performed by iExec Nox
     * ------------------------------------------------------------------------
     */

    function verifyLifecycle(

        uint256 lifecycleId

    ) external {

        lifecycles[lifecycleId].verifiedByNox = true;

        lifecycles[lifecycleId].stage =
            LifecycleStage.PolicyVerification;

        lifecycles[lifecycleId].updatedAt =
            block.timestamp;

        emit VerifiedByNox(lifecycleId);
    }

    /**
     * ------------------------------------------------------------------------
     * Rights Evaluation
     * ------------------------------------------------------------------------
     */

    function evaluateRights(

        uint256 lifecycleId

    ) external {

        lifecycles[lifecycleId].stage =
            LifecycleStage.RightsEvaluation;

        lifecycles[lifecycleId].updatedAt =
            block.timestamp;

        emit StageUpdated(
            lifecycleId,
            LifecycleStage.RightsEvaluation
        );
    }

    /**
     * ------------------------------------------------------------------------
     * Update Lifecycle
     * ------------------------------------------------------------------------
     */

    function updateStage(

        uint256 lifecycleId,

        LifecycleStage stage

    ) external {

        lifecycles[lifecycleId].stage = stage;

        lifecycles[lifecycleId].updatedAt =
            block.timestamp;

        emit StageUpdated(
            lifecycleId,
            stage
        );
    }

    /**
     * ------------------------------------------------------------------------
     * Complete Lifecycle
     * ------------------------------------------------------------------------
     */

    function releaseCollateral(

        uint256 lifecycleId

    ) external {

        lifecycles[lifecycleId].stage =
            LifecycleStage.Released;

        lifecycles[lifecycleId].updatedAt =
            block.timestamp;

        emit StageUpdated(
            lifecycleId,
            LifecycleStage.Released
        );
    }

    /**
     * ------------------------------------------------------------------------
     * Confidential Liquidation
     * ------------------------------------------------------------------------
     */

    function liquidate(

        uint256 lifecycleId

    ) external {

        lifecycles[lifecycleId].stage =
            LifecycleStage.Liquidated;

        lifecycles[lifecycleId].updatedAt =
            block.timestamp;

        emit StageUpdated(
            lifecycleId,
            LifecycleStage.Liquidated
        );
    }

}
