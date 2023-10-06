use starknet::ContractAddress;
use result::ResultTrait;
use snforge_std::{declare, ContractClassTrait};
use starknet::contract_address_const;
use debug::PrintTrait;

fn deploy(name: felt252, calldata: @Array::<felt252>) -> ContractAddress {
    let contract = declare(name);
    let address = contract.deploy(calldata).unwrap();
    address
}

fn DUMMY() -> ContractAddress {
    contract_address_const::<'DUMMY'>()
}
