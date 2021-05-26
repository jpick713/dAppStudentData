pragma solidity >=0.7.0 <0.9.0;

import './StudentTestContract.sol';
import './StudentFormContract.sol';

/**
 * @title Student
 * @dev Set Student Info
 */
contract Student {
    address public county;
    address public studentTestInfo;
    address public studentFormInfo;

    struct StudentInfo {
        string name;
        string studentID;
        uint256 date_of_birth;
        uint256 grade;
        uint256 tier;
        string school;
    }

    StudentInfo public info = new StudentInfo;
        
    // event for EVM logging
    event StudentInfoChanged(string _name, string _studentID,  uint256 _date_of_birth, uint256 _grade, uint256 _tier, string _school);
    
    constructor() public {
        county = msg.sender;
        studentTestInfo = new StudentTestContract(msg.sender, address(this));
        studentFormInfo = new StudentFormContract(msg.sender, address(this));
    }
//    // modifier to check if caller is owner
//    modifier isOwner() {
//        // If the first argument of 'require' evaluates to 'false', execution terminates and all
//        // changes to the state and to Ether balances are reverted.
//        // This used to consume all gas in old EVM versions, but not anymore.
//        // It is often a good idea to use 'require' to check if functions are called correctly.
//        // As a second argument, you can also provide an explanation about what went wrong.
//        require(msg.sender == owner, "Caller is not owner");
//        _;
//    }
    function setStudentInfo(string memory _name, string memory _studentID,  uint256 memory _date_of_birth, uint256 memory _grade, uint256 memory _tier, string memory _school) public {
        emit StudentInfoChanged(_name, _studentID, _date_of_birth, _grade, _tier, _school);
        info.name = _name;
        info.studentID = _studentID;
        info.date_of_birth = _date_of_birth;
        info.grade = _grade;
        info.tier = _tier;
        info.school = _school; 
    }

    function editTestInfo (uint256 memory _testID, uint256 memory _testScoreNum, uint256 memory _peerScoreNum, uint256 memory _goalScoreNum, string memory _scoreType) internal {
            address student_address = address(this);
            studentTestContract studentTests = studentTestContract(studentTestInfo);
            bool validTestID = false;
            for (uint i = 0 ; i<studentTests.tests.length; i++){
                if (studentTests.tests[i] == _testID){
                    validTestID = true;
                    i = studentTest.tests.length + 1;
                }
            } 
            require(validTestID, "This is an invalid test ID for this student!");

    }
    /**
     * @dev Return owner address 
     * @return address of owner
     */
    function getOwner() external view returns (address) {
        return owner;
    }
}