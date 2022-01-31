// SPDX-License-Identifier: MIT

//examining usage of storage or pass by reference and memory or pass by value
pragma solidity ^0.8.11;

contract Pass_By{
    struct Car {
        string make;
        string model;
        uint year;
    }

    Car[] cars;

    function rent(uint _index) public {
        // Car rental_car_1 = cars[_index];
        // this triggers a Solidity warning telling you to explicitly declare `storage` or `memory` or
        // `calldata`

        // here rental_car_1 is a pointer to cars[_index], it has been passed by referenced. Any change
        // to rental_car_1 value will change cars[_index] value too and be stored permanently on the blockchain.
        Car storage rental_car_1 = cars[_index];

        // here rental_car_2 is a copy of cars[_index], it has been passed by value. Any change to its value
        // is limited to the current function scope unless assigned to a state variable.
        Car memory rental_car_2 = cars[_index];

        // assigning the rental_car_2 declared in memory to a state variable like cars[_index]
        cars[_index + 1] = rental_car_2;
    }
}