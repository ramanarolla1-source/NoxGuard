import { ethers } from "hardhat";

async function main() {

  const NOXGUARD = "YOUR_NOXGUARD_ADDRESS";

  const noxGuard = await ethers.getContractAt(
    "NoxGuard",
    NOXGUARD
  );

  console.log("Initializing Confidential Business Policy...");

  await noxGuard.startLifecycle(
    1,
    1,
    1,
    ethers.ZeroHash
  );

  console.log("Business Policy initialized.");
}

main().catch(console.error);
