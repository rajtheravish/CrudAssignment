const hre = require("hardhat");

async function main() {
  const CRUD = await hre.ethers.getContractFactory("CRUD");
  const crud = await CRUD.deploy();

  await crud.deployed();

  const totalNumberOfEmployee1 = await crud.totalEmployees();
  const response = await crud.create(
    "Krishna",
    "krishna@gmail.com",
    23,
    "0x5FbDB2315678afecb367f032d93F642f64180aa3"
  );
  console.log(response);
  const totalNumberOfEmployee2 = await crud.totalEmployees();
  const employee = await crud.employees(0);
  console.log(employee);

  await crud.updateEmployee("Communiti", "krishna@gmail.com");

  const employee2 = await crud.employees(0);
  console.log(employee2);

  const x = await crud.read("krishna@gmail.com");
  console.log(x);

  const y = await crud.deleteEmp("krishna@gmail.com");
  console.log(y);

  const employ = await crud.employees(0);
  console.log(employ);

  

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
