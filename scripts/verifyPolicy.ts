import { ethers } from "hardhat";

async function main() {

  const NOXGUARD = "YOUR_NOXGUARD_ADDRESS";

  const noxGuard = await ethers.getContractAt(
    "NoxGuard",
    NOXGUARD
  );

  console.log("Executing Confidential Business Policy...");

  await noxGuard.executeBusinessPolicy(1);

  console.log("Confidential execution completed.");

}

main().catch(console.error);
