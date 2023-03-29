require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config(); //

const fs = require("fs");
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.2",
  networks: {
    bscTestnet: {
      url: process.env.BSC_RPC_URL,
      accounts: [process.env.PRIVATE_KEY],
      // gasPrice: 8000000000,
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API,
  },
};