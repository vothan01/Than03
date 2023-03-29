const hre = require("hardhat");
require("dotenv").config();

async function main() {

  const [deployer] = await  ethers.getSigners();

  console.log("Deploying contracts with th account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());
/**
 * deployImplementation
 */
  const Implementation = await ethers.getContractFactory("Implementation");
  // const implementation = await Implementation.deploy();
  // console.log("implementation address:", implementation.address);

/**
 *deployProxy1967 set Implement
 */
  // const Proxy = await ethers.getContractFactory("MyProxyBaseContract");
  // const proxy = await Proxy.deploy(process.env.IMPLEMENTATION,"0x");
  // console.log("Proxy address:", proxy.address);

/**
 * Logic implement qua proxy
 */
  implementation = Implementation.attach(process.env.PROXY1967);
  
/**
  *deploytoken
  */
  // const Token = await ethers.getContractFactory("Token");
  // const token = await Token.deploy(process.env.PROXY1967, "Thang","Than");
  // console.log("Token address:", token.address);

/**
 * deployHandler
 */
  // const Handler = await ethers.getContractFactory("AirdropHandler");
  // const handler = await Handler.deploy();
  // console.log("Handler address:", handler.address);

/**
  *set Airdrophandler
  */
  // const setAirdrophandler = await implementation.setAirdropHandler(process.env.HANDLER);
  // await setAirdrophandler.wait();

/**
  *set WHITELIST
  */
  // const setWhitelist = await implementation.setWhitelist(process.env.WHITELIST);
  // await setWhitelist.wait();

/**
  *AIRDROP
  */
  const airdrop = await implementation.Airdrop([process.env.RECEIVER_ADDRESS],2001);
  await airdrop.wait();

}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});
