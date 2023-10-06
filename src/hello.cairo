#[starknet::interface]
trait IHello<TContractState> {
    fn hello(self: @TContractState) -> felt252;
    fn hola(self: @TContractState) -> felt252;
}

#[starknet::contract]
mod Hello {
    use core::result::ResultTrait;
    use sample_contract::hola::IHolaSafeDispatcherTrait;
    use starknet::ContractAddress;
    use sample_contract::hola::{IHolaSafeDispatcher};

    #[storage]
    struct Storage {
        hola_contract: ContractAddress,
    }

    #[constructor]
    fn constructor(ref self: ContractState, hola_contract: ContractAddress) {
        self.hola_contract.write(hola_contract);
    }

    #[external(v0)]
    impl Hello of super::IHello<ContractState> {
        fn hello(self: @ContractState) -> felt252 {
            'hello, world'
        }

        fn hola(self: @ContractState) -> felt252 {
            let contract_address = self.hola_contract.read();
            IHolaSafeDispatcher { contract_address }.hola().unwrap()
        }
    }
}
