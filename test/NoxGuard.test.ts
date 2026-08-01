import { expect } from "chai";
import { ethers } from "hardhat";

describe("NoxGuard", function () {

  async function deployContracts() {

    const Policy = await ethers.getContractFactory("ConfidentialBusinessPolicy");
    const policy = await Policy.deploy();
    await policy.waitForDeployment();

    const Lifecycle = await ethers.getContractFactory("LifecycleManager");
    const lifecycle = await Lifecycle.deploy();
    await lifecycle.waitForDeployment();

    const NoxGuard = await ethers.getContractFactory("NoxGuard");

    const noxGuard = await NoxGuard.deploy(
      await policy.getAddress(),
      await lifecycle.getAddress()
    );

    await noxGuard.waitForDeployment();

    return { noxGuard };
  }

  it("should deploy NoxGuard successfully", async function () {

    const { noxGuard } = await deployContracts();

    expect(await noxGuard.getAddress()).to.not.equal(
      ethers.ZeroAddress
    );

  });

});
