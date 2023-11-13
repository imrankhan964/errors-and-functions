// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LibraryContract {
    mapping(address => bool) private hasJoinedLibrary;
    mapping(address => uint256) public booksCheckedOut;
    uint256 private totalBooksCheckedOut;

    event LibraryMembershipJoined(address indexed member);
    event BookCheckedOut(address indexed member, uint256 booksCheckedOut);

    function joinLibrary() public {
        if (hasJoinedLibrary[msg.sender]) {
            revert("Already a library member");
        }

        hasJoinedLibrary[msg.sender] = true;
        emit LibraryMembershipJoined(msg.sender);
    }

    function checkOutBook() public {
        require(hasJoinedLibrary[msg.sender], "Not a library member. Please join first.");

        // Asserting that the number of books checked out is less than or equal to 3
        assert(booksCheckedOut[msg.sender] <= 3);

        booksCheckedOut[msg.sender]++;
        totalBooksCheckedOut++;

        if (booksCheckedOut[msg.sender] > 3) {
            revert("Maximum limit reached. Please return previous books to check out more.");
        }

        emit BookCheckedOut(msg.sender, booksCheckedOut[msg.sender]);
    }

    function getMembershipStatus() public view returns (string memory) {
        require(hasJoinedLibrary[msg.sender], "Not a library member. Please join first.");
        return "You are a library member.";
    }

}
