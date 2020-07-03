function countOnline(usersObj) {
  // Only change code below this line
  let countOnline = 0;
  for (let user in usersObj) {
    console.log(user)
    if ( usersObj[user].online == true ) {
      countOnline += 1;
    };
  };
  return countOnline
  // Only change code above this line
}

result = countOnline({ Alan: { online: false }, Jeff: { online: true }, Sarah: { online: false } })

console.log(result)