// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title MentorMatching
 * @dev This contract allows users to register as mentors or mentees and match them based on interests.
 * @custom:dev-run-script scripts/scripts.js
 */

contract MentorMatching {
    struct Mentor {
        string name;
        string[] interests;
    }

    struct Mentee {
        string name;
        string[] interests;
    }

    Mentor[] public mentors;
    Mentee[] public mentees;

    function addMentor(string memory _name, string[] memory _interests) public {
        mentors.push(Mentor(_name, _interests));
    }

    function addMentee(string memory _name, string[] memory _interests) public {
        mentees.push(Mentee(_name, _interests));
    }

    function getMentors() public view returns (Mentor[] memory) {
        return mentors;
    }

    function getMentees() public view returns (Mentee[] memory) {
        return mentees;
    }

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
}
