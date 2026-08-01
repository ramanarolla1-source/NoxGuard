// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.24;

/// @title IBusinessPolicy
/// @notice Interface for Confidential Business Policy management.

interface IBusinessPolicy {

    enum PolicyType {
        CollateralPolicy,
        LendingPolicy,
        RiskPolicy,
        CompliancePolicy,
        RightsPolicy,
        LiquidationPolicy
    }

    function createPolicy(
        uint256 policyId,
        PolicyType policyType,
        bytes32 encryptedPolicyHandle
    ) external;

    function verifyPolicy(
        uint256 policyId
    ) external;

    function executePolicy(
        uint256 policyId
    ) external;

}
