use dep::std;

global SMT_SIZE: Field = 253;

fn constrain_included(root: Field, value: Field, path: [Field; SMT_SIZE]) {
  constrain std::merkle::compute_root_from_leaf(1, value, path) == root;
}

fn constrain_excluded(root: Field, value: Field, path: [Field; SMT_SIZE]) {
  constrain std::merkle::compute_root_from_leaf(0, value, path) == root;
}

fn insert(start_root: Field, value: Field, path: [Field; SMT_SIZE]) -> Field {
  constrain std::merkle::compute_root_from_leaf(0, value, path) == start_root;
  std::merkle::compute_root_from_leaf(1, value, path)
}

fn delete(start_root: Field, value: Field, path: [Field; SMT_SIZE]) -> Field {
  constrain std::merkle::compute_root_from_leaf(1, value, path) == start_root;
  std::merkle::compute_root_from_leaf(0, value, path)
}
