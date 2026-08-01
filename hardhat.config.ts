/**
 * ----------------------------------------------------------------------------
 * NoxGuard
 * ----------------------------------------------------------------------------
 *
 * Hardhat Configuration
 *
 * Reference configuration for building and deploying NoxGuard using
 * Hardhat and iExec Nox.
 *
 * This project demonstrates Confidential Business Lifecycle Management
 * powered by iExec Nox.
 *
 * ----------------------------------------------------------------------------
 */

import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

// iExec Nox Hardhat Plugin
import "@iexec/nox-hardhat-plugin";

const config: HardhatUserConfig = {

  solidity: {
    version: "0.8.24",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },

  defaultNetwork: "hardhat",

  networks: {

    hardhat: {},

    sepolia: {
      url: process.env.SEPOLIA_RPC_URL || "",
      accounts: process.env.PRIVATE_KEY
        ? [process.env.PRIVATE_KEY]
        : [],
    },

  },

  paths: {

    sources: "./contracts",

    tests: "./test",

    cache: "./cache",

    artifacts: "./artifacts",

  },

  mocha: {
    timeout: 60000,
  },

};

export default config;
