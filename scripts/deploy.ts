import { ethers } from "hardhat";

async function main() {

  console.log("Deploying NoxGuard...");

  const Policy = await ethers.getContractFactory("ConfidentialBusinessPolicy");
  const policy = await Policy.deploy();
  await policy.waitForDeployment();

  console.log("ConfidentialBusinessPolicy:", await policy.getAddress());

  const Lifecycle = await ethers.getContractFactory("LifecycleManager");
  const lifecycle = await Lifecycle.deploy();
  await lifecycle.waitForDeployment();

  console.log("LifecycleManager:", await lifecycle.getAddress());

  const NoxGuard = await ethers.getContractFactory("NoxGuard");

  const noxGuard = await NoxGuard.deploy(
    await policy.getAddress(),
    await lifecycle.getAddress()
  );

  await noxGuard.waitForDeployment();

  console.log("NoxGuard:", await noxGuard.getAddress());

  console.log("\nDeployment completed successfully.");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
