const hre = require("hardhat");
require("dotenv").config(); 
  
async function main() { 
  [deployer] = await ethers.getSigners();

  const Implementation = await ethers.getContractFactory("Implementation");

  console.log("Deploying contracts with the account:", deployer.address);
  const implementation = Implementation.attach(process.env.PROXY1967);

  //set Admin
  // const setAdmin = await implementation.setAdmin(process.env.MYADDRESS);
  // await setAdmin.wait();
  const setToken = await implementation.setToken20Address(process.env.TOKENADDRESS);
  await setToken.wait();
} 
 
main() 
  .then(async () => { 
    process.exit(); 
  }) 
  .catch((error) => { 
    console.log(error); 
    process.exit(1); 
  });