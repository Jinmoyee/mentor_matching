// scripts/scripts.js

const { ethers } = require("ethers");

// Set up provider (e.g., use Remix's provider)
const provider = new ethers.providers.Web3Provider(window.ethereum);

// Contract ABI and address (replace with your deployed contract's ABI and address)
const contractABI = [
    // Add your contract's ABI here
];
const contractAddress = "YOUR_CONTRACT_ADDRESS";

// Create a contract instance
const contract = new ethers.Contract(contractAddress, contractABI, provider.getSigner());

async function main() {
    // Add some mentors and mentees
    await contract.addMentor("Alice", ["AI", "Blockchain"]);
    await contract.addMentor("Bob", ["Web Development", "Blockchain"]);
    await contract.addMentee("Charlie", ["AI", "Blockchain"]);
    await contract.addMentee("Dave", ["Web Development"]);

    // Get matches
    const matches = await contract.matchMentorsAndMentees();
    console.log("Matches:", matches);
}

main().catch(console.error);
