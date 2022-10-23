//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract CRUD {

    struct employee{
        string name;
        string email;
        uint256 age;
        address walletAddress;
    }

    employee[] public employees;
    uint256 public totalEmployees;

    constructor() {
        totalEmployees = 0;
    }

//Create
    function create(string memory name, string memory email,
     uint256 age, address walletAddress) 
    public returns (uint256 _totalEmployee) {
        employee memory newEmployee = employee(name, email, age, walletAddress);
        employees.push(newEmployee);
        totalEmployees++;
        return totalEmployees;
    }

//Read
    function read(string memory email) external view returns(string memory _name, string memory _email, uint256 _age,address _walletAddress){
        for(uint i = 0; i < totalEmployees; i++) {
            if(compareStrings(employees[i].email, email)) {
                return (employees[i].name,employees[i].email,employees[i].age, employees[i].walletAddress);
            }
        } 
    }

//Update
    function updateEmployee(string memory name, string memory email) external returns (bool) {
        for(uint i = 0; i < totalEmployees; i++) {
            if(compareStrings(employees[i].email, email)) {
                employees[i].name = name;
                return true;
            }
        } 
        return false;
    }

    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }

//Delete
    function deleteEmp(string memory email) external returns(bool){
        uint index;
        for(uint i = 0; i < totalEmployees; i++) {
            if(compareStrings(employees[i].email, email)) {
                index = i;
            }
            if(i==totalEmployees-1)
                return false;
        } 
        
        for(uint i=index;i<totalEmployees-1;i++)
        {
            employees[i] = employees[i+1] ;
        }
        employees.pop();
        totalEmployees--;
        return true;
    }
}