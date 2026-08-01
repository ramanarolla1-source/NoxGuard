import { expect } from "chai";
import { ethers } from "hardhat";

describe("ConfidentialBusinessPolicy", function () {

  it("should create a confidential business policy", async function () {

    const Policy = await ethers.getContractFactory(
      "ConfidentialBusinessPolicy"
    );

    const policy = await Policy.deploy();

    await policy.waitForDeployment();

    await policy.createPolicy(
      1,
      1,
      ethers.ZeroHash
    );

    const storedPolicy = await policy.policies(1);

    expect(storedPolicy.policyId).to.equal(1);

  });

});
