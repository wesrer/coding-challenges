#[cfg(test)]
mod tests {
    use crate::grid_traveler;
    #[test]
    fn it_works() {
        assert_eq!(grid_traveler((1, 1)), 1);
        assert_eq!(grid_traveler((2, 3)), 3);
        assert_eq!(grid_traveler((3, 2)), 3);
        assert_eq!(grid_traveler((3, 3)), 6);
        assert_eq!(grid_traveler((18, 18)), 2333606220);
    }
}

use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

pub type Square = (usize, usize);
pub type Cache = HashMap<Square, usize>;
pub type MutCache = Rc<RefCell<Cache>>;

fn grid_traveler(grid: Square) -> usize {
    let cache = MutCache::default();

    recursive(grid, cache)
}

fn recursive(grid: Square, cache: MutCache) -> usize {
    match grid {
        (0, _) => return 0, // A zero sized grid is undefined
        (_, 0) => return 0,
        (1, _) => return 1, // If there is one row in the grid then there is only one way to traverse it
        (_, 1) => return 1, // If there is one col in the grid then there is only one way to traverse it
        _ => {}
    }

    if let Some(x) = cache.borrow().get(&grid) {
        return *x;
    }

    // recursively reduce the size of the grid
    // reducing the row by 1 means you went down one square
    // reducing the col by 1 means you went left one square
    let x = recursive((grid.0 - 1, grid.1), cache.clone())
        + recursive((grid.0, grid.1 - 1), cache.clone());

    cache.borrow_mut().insert(grid, x);

    x
}
