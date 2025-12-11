 Design and Implementation of a Smart Contract for Secure Authentication and Trusted Data Recording in Electronic Health Records
# Smart Contract for Secure Authentication and Trusted Data Recording in Electronic Health Records

## 📋 Project Overview
This project presents a **blockchain-based solution** for securing **Electronic Health Records (EHRs)** using **Ethereum smart contracts**. The system ensures:
- **Secure Authentication**: Only authorized medical personnel can create records.
- **Trusted Data Recording**: Patient data remains immutable and tamper-proof.

The implementation is done in **Solidity** and deployed via **Remix IDE**, with security analysis against common attacks and performance evaluation of gas consumption.

## 🧩 System Architecture

### Entities
1. **Administrator** – Deploys and manages the smart contract, controls access rights.
2. **Doctor** – Authorized by the Admin to record patient data.
3. **Patient** – Data subject whose records are stored immutably on the blockchain.

### Core Components
- **Data Structure**: `Record` struct storing diagnosis, treatment, timestamp, and doctor address.
- **Mappings**: `authorizedDoctors` for permission management.
- **Events**: `RecordCreated` emitted for off-chain logging.

## 🔧 Implementation Details
- **Language**: Solidity (v0.8.0)
- **Development Environment**: Remix IDE
- **Access Control**: Custom modifier `onlyDoctor` ensures only whitelisted doctors can add records.
- **Data Storage**: Sequential indexing via `recordCount`.

### Key Functions

| Function | Description | Gas Used (Approx.) | Cost (in ETH) |
|----------|-------------|---------------------|---------------|
| Deployment | Contract creation | 650,000 | 0.0019 |
| addDoctor() | Authorize a doctor | 47,464 | 0.0001 |
| addRecord() | Store patient data | 185,290 | 0.0005 |
| getRecord() | Read data (view-only) | 0 | Free |

## 🔒 Security Analysis

| Attack Type | Threat | Defense Mechanism |
|-------------|--------|-------------------|
| **Impersonation** | Unauthorized user tries to add records | `require(authorizedDoctors[msg.sender] == true)` reverts unauthorized transactions |
| **Modification** | Malicious alteration of stored data | Blockchain immutability + no update/delete functions in contract |
| **Replay** | Duplicate transaction submission | Ethereum nonce + automatic `recordCount` increment ensures unique record IDs |

## 📊 Performance Evaluation
- **Gas Consumption**: Measured using Remix IDE Virtual Machine.
- **Most Expensive Operation**: `addRecord()` due to string storage on-chain.
- **Free Operation**: `getRecord()` (view function, no transaction cost).

## ✅ Conclusion
The project successfully demonstrates a **secure, decentralized health record system** with:
- Robust authentication via Solidity modifiers.
- Immutable data storage leveraging blockchain technology.
- Resistance to impersonation, modification, and replay attacks.

## 🙏 Acknowledgments
Special thanks to **Eng. Mohamed Ashraf** for guidance and support.

## 📚 References
1. **[GitHub Repository](https://github.com/Youssefelsaeed/Smart-Contract-in-Electronic-Health-Records)** – Full source code and documentation.

## 🚀 How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/Youssefelsaeed/Smart-Contract-in-Electronic-Health-Records.git

