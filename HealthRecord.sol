// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthRecordSystem {

    // --- 1. DATA STRUCTURES ---
    struct Record {
        uint256 recordId;
        address patientAddress;
        string diagnosis;
        string treatment;
        uint256 timestamp;
        address doctorAddress;
    }

    address public admin; // The owner of the contract
    mapping(address => bool) public authorizedDoctors; // List of allowed doctors
    mapping(uint256 => Record) public records; // Storage for health records
    uint256 public recordCount; // Counter for record IDs

    // --- 2. EVENTS ---
    event DoctorAdded(address indexed doctor);
    event RecordCreated(uint256 indexed id, address indexed patient, address indexed doctor);

    // --- 3. MODIFIERS (SECURITY) ---
    modifier onlyAdmin() {
        require(msg.sender == admin, "Error: Only Admin can perform this action");
        _;
    }

    modifier onlyDoctor() {
        require(authorizedDoctors[msg.sender] == true, "Error: Only authorized doctors can add records");
        _;
    }

    // --- 4. CONSTRUCTOR ---
    constructor() {
        admin = msg.sender; // The person who deploys the contract becomes the Admin
    }

    // --- 5. FUNCTIONS ---

    // Function to authorize a doctor (Authentication)
    function addDoctor(address _doctor) public onlyAdmin {
        authorizedDoctors[_doctor] = true;
        emit DoctorAdded(_doctor);
    }

    // Function to add patient data (Trusted Data Recording)
    function addRecord(address _patient, string memory _diagnosis, string memory _treatment) public onlyDoctor {
        recordCount++; // Increment ID
        
        records[recordCount] = Record(
            recordCount,
            _patient,
            _diagnosis,
            _treatment,
            block.timestamp,
            msg.sender
        );

        emit RecordCreated(recordCount, _patient, msg.sender);
    }

    // Function to retrieve a record
    function getRecord(uint256 _id) public view returns (uint256, address, string memory, string memory, uint256, address) {
        Record memory r = records[_id];
        return (r.recordId, r.patientAddress, r.diagnosis, r.treatment, r.timestamp, r.doctorAddress);
    }
}