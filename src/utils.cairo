#[inline(always)]
fn check_gas() {
    match gas::withdraw_gas() {
        Option::Some(_) => {},
        Option::None(_) => {
            let mut data = array![];
            data.append('Out of gas');
            panic(data)
        },
    }
}
