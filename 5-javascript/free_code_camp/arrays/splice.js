numbers = [0,1,2,3,4,5,6,7,8,9,10];

function show (item) {
  console.log(item);
};

function delete_item (index) {
  let new_arr = [...numbers];
  after = new_arr.splice(index + 1);
  before = new_arr.splice(0, index);
  return before.concat(after);
};

show(numbers.splice(1))
