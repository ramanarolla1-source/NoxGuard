# Technical Documentation

## NoxGuard

### Extending Existing Solidity Smart Contracts with Programmable Privacy using iExec Nox

---

# Overview

NoxGuard is a developer extension that introduces **Confidential Business Lifecycle Management (CBLM)** into existing Solidity smart contracts while leveraging **iExec Nox** for confidential computation.

Unlike traditional middleware, NoxGuard does not replace existing protocols. Instead, it provides a reusable programming model that allows developers to implement **Confidential Business Policies** while preserving protocol composability.

The reference implementation demonstrates this architecture using **Aave**, although the same design can be applied to any Solidity application.

---

# Design Objectives

NoxGuard was designed around five engineering principles.

## 1. Preserve Existing Protocols

Existing Solidity protocols remain unchanged.

NoxGuard extends their capabilities without modifying business logic or protocol architecture.

---

## 2. Separate Responsibilities

Each component performs a single responsibility.

| Component | Responsibility |
|-----------|----------------|
| Existing Protocol | Business Operations |
| NoxGuard | Confidential Business Lifecycle Management |
| iExec Nox | Confidential Computation |
| Ethereum | Settlement & Consensus |

---

## 3. Programmable Privacy

Confidentiality should be implemented as reusable business workflows rather than isolated smart contract functions.

---

## 4. Modular Architecture

Each module can evolve independently.

- Business Policies
- Lifecycle Management
- Rights Evaluation
- Policy Verification

---

## 5. Institution-Ready Design

NoxGuard focuses on protecting institutional business intelligence rather than only digital assets.

---

# System Architecture

```
                     Existing Protocol

                           │

 Borrow • Repay • Collateral • Liquidation

                           │

══════════════════════════════════════════════

                     NOXGUARD

    Confidential Business Lifecycle Management

        • Business Policy Engine

        • Rights Evaluation

        • Policy Verification

        • Lifecycle Manager

══════════════════════════════════════════════

                           │

══════════════════════════════════════════════

                    iExec NOX

        Confidential Computation Runtime

        • Trusted Execution Environment

        • Confidential Execution

        • Cryptographic Attestation

══════════════════════════════════════════════

                           │

                    Ethereum
```

---

# Core Components

## NoxGuard.sol

Primary orchestration contract.

Responsibilities:

- Coordinates business policies
- Starts confidential workflows
- Delegates confidential execution
- Advances lifecycle states

---

## ConfidentialBusinessPolicy.sol

Defines confidential institutional policies.

Examples include:

- Lending Policies
- Risk Policies
- Compliance Policies
- Rights Policies
- Liquidation Policies

Policy evaluation is delegated to iExec Nox.

---

## LifecycleManager.sol

Implements Confidential Business Lifecycle Management.

Lifecycle stages include:

- Created
- Policy Verification
- Rights Evaluation
- Pending Approval
- Active
- Monitoring
- Repayment
- Released
- Defaulted
- Liquidated

---

## Interfaces

The project exposes clean Solidity interfaces for:

- IBusinessPolicy
- ILifecycleManager
- INoxGuard

These interfaces simplify protocol integration and future extensibility.

---

# Confidential Business Lifecycle

NoxGuard introduces a reusable lifecycle for institutional workflows.

```
Create Request

↓

Business Policy Verification

↓

Rights Evaluation

↓

Confidential Approval

↓

Active Lifecycle

↓

Continuous Monitoring

↓

Repayment

↓

Release Assets

──────────── OR ────────────

Default

↓

Confidential Liquidation
```

Each lifecycle transition may require confidential policy evaluation.

---

# Business Policy Model

Unlike traditional Solidity development where business logic is directly embedded inside contracts, NoxGuard separates policy implementation from confidential execution.

Business policies include:

- Risk Models
- Lending Policies
- Rights Verification
- Portfolio Constraints
- Internal Compliance Rules
- Institutional Workflows

Only policy outcomes become visible.

Policy evaluation remains confidential.

---

# Request Flow

```
Institution

↓

Existing Solidity Contract

↓

NoxGuard

↓

Business Policy Engine

↓

iExec Nox

↓

TEE Execution

↓

Cryptographic Attestation

↓

Verified Decision

↓

Ethereum Settlement
```

---

# Integration Flow

NoxGuard integrates with existing Solidity protocols without modifying protocol logic.

Example:

```
Aave

↓

Borrow Request

↓

NoxGuard

↓

Policy Verification

↓

Rights Evaluation

↓

iExec Nox

↓

Verified Result

↓

Aave Execution

↓

Ethereum Settlement
```

This pattern can be reused for:

- Treasury Systems
- Institutional Funds
- Insurance
- Payroll
- Tokenized RWAs

---

# Smart Contract Structure

```
contracts/

NoxGuard.sol

ConfidentialBusinessPolicy.sol

LifecycleManager.sol

interfaces/

    IBusinessPolicy.sol

    ILifecycleManager.sol

    INoxGuard.sol
```

---

# Security Model

Security responsibilities are intentionally separated.

## NoxGuard

Responsible for:

- Workflow orchestration
- Policy implementation
- Lifecycle management

---

## iExec Nox

Responsible for:

- Confidential computation
- Trusted Execution Environment
- Cryptographic attestation
- Verifiable execution

---

## Ethereum

Responsible for:

- Settlement
- Consensus
- State verification

---

# Extending NoxGuard

Developers can introduce additional confidential policies without modifying the architecture.

Possible extensions include:

- Treasury Policies
- DAO Governance Policies
- Payroll Policies
- Insurance Policies
- Institutional Investment Policies
- Compliance Policies
- AI-assisted Risk Evaluation

The lifecycle remains reusable.

Only policy implementations change.

---

# Future Development

Potential enhancements include:

- Multi-protocol integrations
- Multiple confidential policy engines
- Cross-chain lifecycle management
- Enterprise governance workflows
- Confidential treasury automation
- Institutional DAO operations

---

# Conclusion

NoxGuard demonstrates a reusable programming model for implementing **Confidential Business Lifecycle Management** in Solidity.

By separating business policy implementation from confidential execution, developers can extend existing smart contracts with programmable privacy while relying on **iExec Nox** for confidential computation, Trusted Execution Environments, and cryptographic attestation.

This approach enables institutional-grade smart contracts without sacrificing protocol composability or blockchain transparency.
