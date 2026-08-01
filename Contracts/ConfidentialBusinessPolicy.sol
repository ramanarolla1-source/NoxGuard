/**
 * ----------------------------------------------------------------------------
 *  NOXGUARD
 * ----------------------------------------------------------------------------
 *
 *  ConfidentialBusinessPolicy.sol
 *
 *  Purpose
 *  -------
 *  This contract demonstrates how institutional business policies can be
 *  represented inside Solidity while delegating confidential policy evaluation
 *  to iExec Nox.
 *
 *  Traditional smart contracts expose business rules publicly on-chain.
 *  NoxGuard introduces Confidential Business Policies that execute privately
 *  through Nox-powered confidential computation inside Trusted Execution
 *  Environments (TEE).
 *
 *  NoxGuard DOES NOT replace existing protocols.
 *
 *  Instead, it extends existing Solidity applications by introducing
 *  Confidential Business Lifecycle Management while preserving protocol
 *  composability.
 *
 *  Reference Integration:
 *      - Aave Lending
 *
 *  Confidential Business Policies may include:
 *
 *      • Collateral Evaluation
 *      • Rights Verification
 *      • Lending Policies
 *      • Liquidation Policies
 *      • Risk Evaluation
 *      • Portfolio Rules
 *      • Compliance Policies
 *      • Institutional Business Logic
 *
 *  NoxGuard determines WHAT policy should execute.
 *
 *  iExec Nox determines HOW confidential execution occurs.
 *
 * ----------------------------------------------------------------------------
 */

pragma solidity ^0.8.24;

/// @title Confidential Business Policy
/// @author NoxGuard
/// @notice Demonstration contract for Confidential Business Policy execution.

contract ConfidentialBusinessPolicy {

    /**
     * ------------------------------------------------------------------------
     * Business Policy Types
     * ------------------------------------------------------------------------
     */

    enum PolicyType {
        CollateralPolicy,
        LendingPolicy,
        RiskPolicy,
        CompliancePolicy,
        RightsPolicy,
        LiquidationPolicy
    }

    /**
     * ------------------------------------------------------------------------
     * Business Lifecycle States
     * ------------------------------------------------------------------------
     */

    enum LifecycleState {
        Created,
        PendingVerification,
        Active,
        Suspended,
        Repaid,
        Released,
        Liquidated
    }

    /**
     * ------------------------------------------------------------------------
     * Confidential Policy
     * ------------------------------------------------------------------------
     */

    struct ConfidentialPolicy {

        uint256 policyId;

        PolicyType policyType;

        LifecycleState lifecycle;

        bytes32 encryptedPolicyHandle;

        bool verified;

        bool executedByNox;

        uint256 lastEvaluation;
    }

    mapping(uint256 => ConfidentialPolicy) public policies;

    /**
     * ------------------------------------------------------------------------
     * Events
     * ------------------------------------------------------------------------
     */

    event PolicyCreated(uint256 indexed policyId);

    event PolicyVerified(uint256 indexed policyId);

    event PolicyExecutedByNox(uint256 indexed policyId);

    event LifecycleUpdated(
        uint256 indexed policyId,
        LifecycleState state
    );

    /**
     * ------------------------------------------------------------------------
     * Create Confidential Policy
     * ------------------------------------------------------------------------
     */

    function createPolicy(

        uint256 policyId,

        PolicyType policyType,

        bytes32 encryptedPolicyHandle

    ) external {

        policies[policyId] = ConfidentialPolicy({

            policyId: policyId,

            policyType: policyType,

            lifecycle: LifecycleState.Created,

            encryptedPolicyHandle: encryptedPolicyHandle,

            verified: false,

            executedByNox: false,

            lastEvaluation: block.timestamp
        });

        emit PolicyCreated(policyId);
    }

    /**
     * ------------------------------------------------------------------------
     * Verify Policy
     *
     * (Executed through iExec Nox)
     * ------------------------------------------------------------------------
     */

    function verifyPolicy(

        uint256 policyId

    ) external {

        policies[policyId].verified = true;

        policies[policyId].lifecycle =
            LifecycleState.PendingVerification;

        emit PolicyVerified(policyId);
    }

    /**
     * ------------------------------------------------------------------------
     * Execute Confidential Business Policy
     *
     * Nox performs confidential computation.
     * ------------------------------------------------------------------------
     */

    function executePolicy(

        uint256 policyId

    ) external {

        policies[policyId].executedByNox = true;

        policies[policyId].lastEvaluation = block.timestamp;

        emit PolicyExecutedByNox(policyId);
    }

    /**
     * ------------------------------------------------------------------------
     * Update Lifecycle
     * ------------------------------------------------------------------------
     */

    function updateLifecycle(

        uint256 policyId,

        LifecycleState state

    ) external {

        policies[policyId].lifecycle = state;

        emit LifecycleUpdated(policyId, state);
    }

}
