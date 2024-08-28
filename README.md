# MentorMatching Smart Contract

## Overview

The `MentorMatching` smart contract is designed to facilitate the matching of mentors and mentees based on their interests. This decentralized application (dApp) allows users to register as mentors or mentees and then matches them according to shared interests. The smart contract is built using Solidity and is intended to be deployed on the Ethereum blockchain.

## Features

- **Mentor Registration:** Mentors can register by providing their name and a list of interests.
- **Mentee Registration:** Mentees can register by providing their name and a list of interests.
- **Matching System:** The contract matches mentors and mentees based on overlapping interests.
- **View Registered Users:** The contract allows users to view the list of all registered mentors and mentees.
- **View Matches:** Users can view the matches between mentors and mentees based on shared interests.

## Smart Contract Diagram

Below is a simplified diagram that illustrates the workflow of the `MentorMatching` smart contract:

```plaintext
+---------------------+        +---------------------+
|                     |        |                     |
|     Mentor[]        |        |     Mentee[]        |
|                     |        |                     |
+----------+----------+        +----------+----------+
           |                            |
           |                            |
           v                            v
+----------+----------+        +----------+----------+
|                     |        |                     |
| addMentor()         |        | addMentee()         |
| Registers a Mentor  |        | Registers a Mentee  |
+----------+----------+        +----------+----------+
           |                            |
           |                            |
           v                            v
+----------+----------+        +----------+----------+
|                     |        |                     |
|   matchMentorsAnd   |        |  matchMentorsAnd    |
|  Mentees()          |        |  Mentees()          |
| Matches Mentors and |<-------| Matches Mentees and |
| Mentees by Interests|        | Mentors by Interests|
+---------------------+        +---------------------+
```

## Contract Details

### Contract Structure

- **Mentor Struct:**
  - `string name;` - The name of the mentor.
  - `string[] interests;` - The list of interests of the mentor.

- **Mentee Struct:**
  - `string name;` - The name of the mentee.
  - `string[] interests;` - The list of interests of the mentee.

### Functions

1. **addMentor(string memory _name, string[] memory _interests):**  
   Registers a new mentor with their name and interests.
   ```solidity
   function addMentor(string memory _name, string[] memory _interests) public {
       mentors.push(Mentor(_name, _interests));
   }
   ```

2. **addMentee(string memory _name, string[] memory _interests):**  
   Registers a new mentee with their name and interests.
   ```solidity
   function addMentee(string memory _name, string[] memory _interests) public {
       mentees.push(Mentee(_name, _interests));
   }
   ```

3. **getMentors():**  
   Returns the list of all registered mentors.
   ```solidity
   function getMentors() public view returns (Mentor[] memory) {
       return mentors;
   }
   ```

4. **getMentees():**  
   Returns the list of all registered mentees.
   ```solidity
   function getMentees() public view returns (Mentee[] memory) {
       return mentees;
   }
   ```

5. **matchMentorsAndMentees():**  
   Matches mentors and mentees based on shared interests and returns the list of matches.
   ```solidity
   function matchMentorsAndMentees() public view returns (string[] memory) {
       string[] memory matches = new string[](mentees.length);
       for (uint i = 0; i < mentees.length; i++) {
           string memory menteeName = mentees[i].name;
           for (uint j = 0; j < mentors.length; j++) {
               Mentor memory mentor = mentors[j];
               for (uint k = 0; k < mentees[i].interests.length; k++) {
                   for (uint l = 0; l < mentor.interests.length; l++) {
                       if (keccak256(abi.encodePacked(mentees[i].interests[k])) == keccak256(abi.encodePacked(mentor.interests[l]))) {
                           matches[i] = string(abi.encodePacked(menteeName, " matched with ", mentor.name));
                           break;
                       }
                   }
               }
           }
       }
       return matches;
   }
   ```

## How to Deploy

1. Compile the contract using a Solidity compiler like Hardhat or Truffle.
2. Deploy the contract to an Ethereum-compatible network.
3. Use the functions `addMentor` and `addMentee` to register users.
4. Use `matchMentorsAndMentees` to view matches between mentors and mentees.

## How to Run the Script

Ensure that the following line is included in your contract:

```solidity
/// @custom:dev-run-script scripts/scripts.js
```

This points to a script that interacts with your smart contract. The script file should be located in the `scripts/` directory of your project.

## License

This project is licensed under the MIT License.

---
