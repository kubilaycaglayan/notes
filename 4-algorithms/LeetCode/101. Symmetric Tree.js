/* SOLUTION 1 RECURSIVE*/
const isMirror = (tree1, tree2) => {
  if(tree1 === null && tree2 === null) return true;
  if(tree1 === null || tree2 === null) return false;

  return (tree1.val === tree2.val)
    && isMirror(tree1.right, tree2.left)
    && isMirror(tree1.left, tree2.right);
}

var isSymmetric = function(root) {
return isMirror(root, root);
};


/* SOLUTION 2 ITERATIVE*/
const isSymmetric = (root) => {
  const queue = [root, root];

  while (queue.length > 0) {
      tree1 = queue.shift();
      tree2 = queue.shift();

      if (tree1 === null && tree2 === null) continue;
      if (tree1 === null || tree2 === null ) return false;
      if (tree1.val !== tree2.val) return false;

      queue.push(tree1.left);
      queue.push(tree2.right);
      queue.push(tree1.right);
      queue.push(tree2.left);
  }
  return true;
}