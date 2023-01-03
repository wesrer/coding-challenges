#[cfg(test)]
mod tests {
    use crate::fib;
    #[test]
    fn it_works() {
        assert_eq!(fib(1), 1);
        assert_eq!(fib(2), 1);
        assert_eq!(fib(4), 3);
        assert_eq!(fib(30), 832040);
        assert_eq!(fib(50), 12586269025);
        assert_eq!(fib(50), 12586269025);
    }
}

use std::collections::HashMap;
use std::rc::Rc;
use std::cell::RefCell;

fn fib(num: usize) -> usize {
    let mut cache = Rc::new(RefCell::new(HashMap::new()));

    recursive_fib(num, cache.clone())
}

fn recursive_fib(num: usize, cache: Rc<RefCell<HashMap<usize, usize>>>) -> usize {
    // base case
    if num <= 2 {
        return 1;
    }

    if let Some(x) = cache.borrow().get(&num){
        println!("inside cache for {}", num);
        return *x;
    } 
    
    let x = recursive_fib(num - 1, cache.clone()) + recursive_fib(num - 2, cache.clone());
    cache.borrow_mut().insert(num, x);

    x
}
