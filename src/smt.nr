use dep::std;

global SMT_SIZE: Field = 253;

fn insert(start_root: Field, value: Field, path: [Field; SMT_SIZE]) -> Field {
  constrain std::merkle::compute_root_from_leaf(0, value, path) == start_root;
  std::merkle::compute_root_from_leaf(1, value, path)
}

fn delete(start_root: Field, value: Field, path: [Field; SMT_SIZE]) -> Field {
  constrain std::merkle::compute_root_from_leaf(1, value, path) == start_root;
  std::merkle::compute_root_from_leaf(0, value, path)
}
