// SPDX-License-Identifier: MIT 
//testing version change 
pragma solidity >=0.4.22 <0.9.0;

contract Tickets {

    uint256 constant TOTAL_TICKETS = 10;

    address public owner = msg.sender;

    struct Ticket {
        uint256 id;
        uint256 price;
        address owner;
    }

    Ticket[TOTAL_TICKETS] public tickets;

    constructor() public {
        for (uint256 i = 0; i < TOTAL_TICKETS; i++) {
            tickets[i].id = i;
            tickets[i].price = 1e17; // 0.1 ETH
            tickets[i].owner = address(0x0);
        }
    }

    function buyTicket(uint256 _index) external payable {
        require(_index < TOTAL_TICKETS && _index >= 0);
        require(tickets[_index].owner == address(0x0));
        require(msg.value >= tickets[_index].price);
        tickets[_index].owner = msg.sender;
    }
}