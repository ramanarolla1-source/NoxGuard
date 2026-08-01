import { expect } from "chai";
import { ethers } from "hardhat";

describe("LifecycleManager", function () {

  it("should create a confidential business lifecycle", async function () {

    const Lifecycle = await ethers.getContractFactory(
      "LifecycleManager"
    );

    const lifecycle = await Lifecycle.deploy();

    await lifecycle.waitForDeployment();

    await lifecycle.createLifecycle(
      1,
      ethers.ZeroHash
    );

    const workflow = await lifecycle.lifecycles(1);

    expect(workflow.lifecycleId).to.equal(1);

  });

});
