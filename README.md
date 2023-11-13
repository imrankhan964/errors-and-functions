## Library Contract

## Overview

This Solidity smart contract, named LibraryContract, is designed to manage a simple library membership system where users can join the library, check out books, and inquire about their membership status. The contract employs the Ethereum blockchain to ensure transparency and security in library operations.

## Features

1. **Membership System:**
   - Users can join the library.
   - Emits `LibraryMembershipJoined` event upon successful registration.
   - Prevents duplicate registrations with a `require` statement and a `revert` message.

2. **Book Checkout:**
   - Users can borrow books by calling `checkOutBook`.
   - Requires library membership using `require`, reverts with a message if not a member.
   - Tracks individual and total checked-out books.
   - Emits `BookCheckedOut` event on successful book checkout.
   - Enforces a maximum limit of 3 checked-out books per user with an `assert` statement.
   - Reverts with a message if the maximum limit is exceeded.

3. **Membership Status Inquiry:**
   - Users can check their library membership status.
   - Uses `require` to ensure library membership; otherwise, reverts with a message.
   - Returns a string indicating membership status.

## Usage Guidelines:

1. **Joining the Library:**
   - Call `joinLibrary` to become a library member.

2. **Checking Out Books:**
   - Use `checkOutBook` to borrow books.
   - Ensure library membership using `require` before attempting checkout.
   - Maximum limit: 3 books; excess will trigger a revert with a message.

3. **Inquiring about Membership:**
   - Call `getMembershipStatus` to check membership status.

## Events:

- `LibraryMembershipJoined`:
  - Emits when a user joins the library.

- `BookCheckedOut`:
  - Emits when a user successfully checks out a book.

## Usage Guidelines:

 ## 1. Joining the Library:

Call joinLibrary to become a library member.

## 2. Checking Out Books:

Use checkOutBook to borrow books.

Ensure library membership before attempting checkout.

Maximum limit: 3 books.

## 3. Inquiring about Membership:

Call getMembershipStatus to check membership status.
