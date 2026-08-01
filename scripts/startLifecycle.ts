import { ethers } from "hardhat";

async function main() {

  const NOXGUARD = "YOUR_NOXGUARD_ADDRESS";

  const noxGuard = await ethers.getContractAt(
    "NoxGuard",
    NOXGUARD
  );

  console.log("Requesting confidential policy evaluation...");

  await noxGuard.requestPolicyEvaluation(1);

  console.log("Policy evaluation requested.");
}

main().catch(console.error);
