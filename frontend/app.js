/**
 * ------------------------------------------------------------------
 * NOXGUARD
 * frontend/app.js
 *
 * Demonstration Dashboard
 *
 * This frontend visualizes the Confidential Business Lifecycle
 * Management workflow of NoxGuard.
 *
 * Note:
 * This is a reference UI demonstrating the workflow.
 * ------------------------------------------------------------------
 */

const policyStatus = document.getElementById("policy-status");
const lifecycleStatus = document.getElementById("lifecycle-status");
const teeStatus = document.getElementById("tee-status");
const settlementStatus = document.getElementById("settlement-status");

const btnInitialize = document.getElementById("btnInitialize");
const btnVerify = document.getElementById("btnVerify");
const btnExecute = document.getElementById("btnExecute");
const btnReset = document.getElementById("btnReset");

function initializePolicy() {

    policyStatus.innerText = "Business Policy Created";
    lifecycleStatus.innerText = "Created";
    teeStatus.innerText = "Waiting";
    settlementStatus.innerText = "Pending";

}

function verifyPolicy() {

    policyStatus.innerText = "Policy Verified";
    lifecycleStatus.innerText = "Rights Evaluation";
    teeStatus.innerText = "TEE Verification";
    settlementStatus.innerText = "Pending";

}

function executePolicy() {

    policyStatus.innerText = "Confidential Policy Executed";
    lifecycleStatus.innerText = "Monitoring";
    teeStatus.innerText = "Execution Verified";
    settlementStatus.innerText = "Ethereum Settlement Completed";

}

function resetWorkflow() {

    policyStatus.innerText = "Not Initialized";
    lifecycleStatus.innerText = "Idle";
    teeStatus.innerText = "Waiting";
    settlementStatus.innerText = "Not Started";

}

btnInitialize.addEventListener("click", initializePolicy);

btnVerify.addEventListener("click", verifyPolicy);

btnExecute.addEventListener("click", executePolicy);

btnReset.addEventListener("click", resetWorkflow);

resetWorkflow();
