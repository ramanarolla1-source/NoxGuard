# NoxGuard Architecture

## Architecting Programmable Privacy for Institutional Smart Contracts

---

# Overview

NoxGuard is a developer extension that introduces **Confidential Business Lifecycle Management** into existing Solidity smart contracts while leveraging **iExec Nox** for confidential computation.

NoxGuard does **not** replace existing protocols.

Instead, it enhances existing Solidity applications by introducing a reusable programming model for implementing **Confidential Business Policies** without modifying protocol logic.

Our reference implementation demonstrates this architecture using **Aave**, although the same design can be applied to any institutional Solidity application.

---

# Architectural Philosophy

NoxGuard separates responsibilities into four independent layers.

```
                    Existing Protocol
                         (Aave)

 Borrow • Repay • Liquidation • Collateral

                           │
                           ▼

══════════════════════════════════════════════

                     NOXGUARD

     Confidential Business Lifecycle Management

     • Business Policy Implementation
     • Rights Evaluation
     • Policy Verification
     • Lifecycle Decisions
     • State Transitions

══════════════════════════════════════════════

                           │
                           ▼

                      iExec NOX

        Confidential Computation Runtime

        • Encrypted Computation
        • Trusted Execution Environment
        • Cryptographic Attestation
        • Verifiable Execution

══════════════════════════════════════════════

                           │
                           ▼

                  Ethereum Settlement
```

---

# Layer Responsibilities

## Existing Solidity Protocol

Existing protocols continue managing their native business operations.

Examples include:

- Lending
- Borrowing
- Repayment
- Liquidation
- Collateral Management

No protocol modifications are required.

---

## NoxGuard

NoxGuard introduces **Confidential Business Lifecycle Management**.

Responsibilities include:

- Business Policy Implementation
- Rights Evaluation
- Policy Verification
- Lifecycle State Management
- Confidential Workflow Orchestration

NoxGuard determines **what business policy should execute** and **when lifecycle transitions occur**.

NoxGuard does **not** execute confidential computation.

---

## iExec Nox

iExec Nox performs confidential computation.

Responsibilities include:

- Confidential Smart Contract Execution
- Trusted Execution Environment (TEE)
- Confidential Data Processing
- Cryptographic Attestation
- Verifiable Execution

Nox determines **how confidential execution occurs**.

---

## Ethereum

Ethereum remains responsible for:

- Smart Contract Settlement
- State Finality
- Transaction Ordering
- Consensus
- Public Verification

Only the final verified state transition is committed on-chain.

---

# Confidential Business Lifecycle

Every institutional workflow progresses through a series of confidential lifecycle stages.

```
Created

↓

Business Policy Verification

↓

Rights Evaluation

↓

Pending Approval

↓

Active

↓

Monitoring

↓

Repayment

↓

Released

────────────── OR ──────────────

Default

↓

Confidential Liquidation
```

Each lifecycle transition may require confidential evaluation before progressing to the next stage.

---

# Confidential Business Policies

Unlike traditional Solidity applications where business rules are publicly visible, NoxGuard enables confidential implementation of institutional policies.

Examples include:

- Lending Policies
- Risk Models
- Portfolio Strategies
- Collateral Policies
- Rights Management
- Internal Compliance Rules
- Institutional Approval Policies

These policies remain confidential while being executed through iExec Nox.

---

# Request Flow

The following illustrates a typical confidential workflow.

```
Institution

↓

Existing Solidity Application

↓

NoxGuard

↓

Business Policy Evaluation

↓

iExec Nox

↓

TEE Execution

↓

Cryptographic Attestation

↓

Verified Result

↓

Ethereum Settlement
```

---

# Reference Integration

NoxGuard demonstrates the architecture by integrating with **Aave**.

Aave continues managing:

- Lending
- Borrowing
- Repayment
- Liquidation

NoxGuard adds:

- Confidential Business Policies
- Lifecycle Management
- Rights Evaluation
- Policy Verification

iExec Nox provides:

- Confidential Computation
- Trusted Execution
- Cryptographic Attestation

No modifications to the Aave protocol are required.

---

# Why This Architecture?

Traditional smart contracts expose operational intelligence publicly.

Institutional finance requires confidentiality not only for assets, but also for the business policies governing those assets.

NoxGuard introduces a reusable programming model that enables developers to organize confidential business logic while allowing iExec Nox to confidentially execute policy evaluations.

---

# Design Principles

NoxGuard follows five architectural principles.

### Separation of Responsibilities

Each layer performs a single responsibility.

### Existing Protocol Compatibility

No protocol modifications.

### Reusable Programming Model

Confidential Business Lifecycle Management can be integrated across multiple institutional applications.

### Programmable Privacy

Business policies remain confidential while preserving blockchain composability.

### Nox as the Confidential Computing Foundation

NoxGuard depends entirely on iExec Nox for confidential execution.

---

# Future Extensions

Although demonstrated using Aave, the same architecture can support:

- Treasury Management
- Institutional Funds
- Tokenized RWAs
- Payroll Systems
- Insurance Platforms
- DAO Treasury Operations
- Enterprise Financial Workflows

---

# Conclusion

NoxGuard demonstrates how developers can extend existing Solidity smart contracts with **Confidential Business Lifecycle Management**, while leveraging **iExec Nox** for confidential computation, Trusted Execution Environments, and programmable privacy.

Rather than replacing existing blockchain protocols, NoxGuard enhances them with reusable confidential business workflows suitable for institutional finance.
