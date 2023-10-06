#[starknet::interface]
trait IHola<TContractState> {
    fn hola(self: @TContractState) -> felt252;
}

#[starknet::contract]
mod Hola {
    #[storage]
    struct Storage {}

    #[external(v0)]
    impl Hola of super::IHola<ContractState> {
        fn hola(self: @ContractState) -> felt252 {
            'hola, mundo'
        }
    }
}
