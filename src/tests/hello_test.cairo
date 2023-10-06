use debug::PrintTrait;
use snforge_std::{ContractClassTrait};
use sample_contract::tests::utils;
use sample_contract::hello::{IHelloDispatcher, IHelloDispatcherTrait};

#[test]
#[available_gas(200000)]
fn test_hello() {
    let mut calldata = array![];
    calldata.append(utils::DUMMY().into());
    let address = utils::deploy('Hello', @calldata);
    let dispatcher = IHelloDispatcher { contract_address: address };
    let mut result = dispatcher.hello();
    assert(result == 'hello, world', 'Invalid value')
}

#[test]
#[available_gas(200000)]
fn test_hola() {
    let mut calldata = array![];
    let hola_address = utils::deploy('Hola', @calldata);

    calldata.append(hola_address.into());
    let hello_address = utils::deploy('Hello', @calldata);
    let dispatcher = IHelloDispatcher { contract_address: hello_address };

    let result = dispatcher.hola();
    assert(result == 'hola, mundo', 'Invalid value');
}
