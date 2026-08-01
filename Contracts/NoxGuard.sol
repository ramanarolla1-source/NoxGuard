/**
 * ----------------------------------------------------------------------------
 *  NOXGUARD
 * ----------------------------------------------------------------------------
 *
 *  NoxGuard.sol
 *
 *  Purpose
 *  -------
 *  NoxGuard is the orchestration layer that introduces Confidential Business
 *  Lifecycle Management into existing Solidity smart contracts.
 *
 *  It coordinates:
 *
 *      • Confidential Business Policies
 *      • Business Lifecycle Management
 *      • Rights Evaluation
 *      • Policy Verification
 *      • Lifecycle State Transitions
 *
 *  while delegating confidential computation to iExec Nox.
 *
 *  NoxGuard DOES NOT replace existing protocols.
 *
 *  Existing protocols (such as Aave) continue managing business operations.
 *
 *  NoxGuard organizes confidential business decisions.
 *
 *  iExec Nox confidentially executes those decisions inside Trusted Execution
 *  Environments (TEE) and produces cryptographic attestation.
 *
 * ----------------------------------------------------------------------------
 */

pragma solidity ^0.8.24;

import "./ConfidentialBusinessPolicy.sol";
import "./LifecycleManager.sol";

/// @title NoxGuard
/// @author NoxGuard
/// @notice Orchestrates Confidential Business Lifecycle Management using iExec Nox.

contract NoxGuard {

    ConfidentialBusinessPolicy public policyManager;

    LifecycleManager public lifecycleManager;

    constructor(

        address policyContract,

        address lifecycleContract

    ) {

        policyManager =
            ConfidentialBusinessPolicy(policyContract);

        lifecycleManager =
            LifecycleManager(lifecycleContract);
    }

    /**
     * ------------------------------------------------------------------------
     * Events
     * ------------------------------------------------------------------------
     */

    event BusinessLifecycleStarted(
        uint256 indexed policyId,
        uint256 indexed lifecycleId
    );

    event PolicyEvaluationRequested(
        uint256 indexed policyId
    );

    event ConfidentialExecutionCompleted(
        uint256 indexed policyId
    );

    /**
     * ------------------------------------------------------------------------
     * Start Confidential Business Lifecycle
     * ------------------------------------------------------------------------
     */

    function startLifecycle(

        uint256 policyId,

        uint256 lifecycleId,

        ConfidentialBusinessPolicy.PolicyType policyType,

        bytes32 encryptedPolicyHandle

    ) external {

        policyManager.createPolicy(

            policyId,

            policyType,

            encryptedPolicyHandle
        );

        lifecycleManager.createLifecycle(

            lifecycleId,

            encryptedPolicyHandle
        );

        emit BusinessLifecycleStarted(

            policyId,

            lifecycleId
        );
    }

    /**
     * ------------------------------------------------------------------------
     * Request Confidential Policy Evaluation
     *
     * Delegated to iExec Nox
     * ------------------------------------------------------------------------
     */

    function requestPolicyEvaluation(

        uint256 policyId

    ) external {

        policyManager.verifyPolicy(policyId);

        emit PolicyEvaluationRequested(policyId);
    }

    /**
     * ------------------------------------------------------------------------
     * Execute Confidential Business Policy
     *
     * iExec Nox performs confidential computation.
     * ------------------------------------------------------------------------
     */

    function executeBusinessPolicy(

        uint256 policyId

    ) external {

        policyManager.executePolicy(policyId);

        emit ConfidentialExecutionCompleted(policyId);
    }

    /**
     * ------------------------------------------------------------------------
     * Advance Business Lifecycle
     * ------------------------------------------------------------------------
     */

    function advanceLifecycle(

        uint256 lifecycleId,

        LifecycleManager.LifecycleStage stage

    ) external {

        lifecycleManager.updateStage(

            lifecycleId,

            stage
        );
    }

    /**
     * ------------------------------------------------------------------------
     * Complete Business Lifecycle
     * ------------------------------------------------------------------------
     */

    function releaseCollateral(

        uint256 lifecycleId

    ) external {

        lifecycleManager.releaseCollateral(

            lifecycleId
        );
    }

    /**
     * ------------------------------------------------------------------------
     * Trigger Confidential Liquidation
     * ------------------------------------------------------------------------
     */

    function confidentialLiquidation(

        uint256 lifecycleId

    ) external {

        lifecycleManager.liquidate(

            lifecycleId
        );
    }

}
