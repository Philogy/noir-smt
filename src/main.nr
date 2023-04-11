mod smt;
use dep::std;

fn main(start_root: pub Field, value: pub Field, path: [Field; smt::SMT_SIZE]) -> pub Field {
  smt::insert(start_root, value, path)
}
