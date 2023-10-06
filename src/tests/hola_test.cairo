use debug::PrintTrait;
use result::ResultTrait;
use sample_contract::hola::{IHolaSafeDispatcher, IHolaSafeDispatcherTrait};
use sample_contract::tests::utils;

#[test]
#[available_gas(200000)]
fn test_hola() {
    let mut calldata = array![];
    let address = utils::deploy('Hola', @calldata);
    address.print();
    let dispatcher = IHolaSafeDispatcher { contract_address: address };
    let result = dispatcher.hola().unwrap();
    assert(result == 'hola, mundo', 'Invalid value');
}

