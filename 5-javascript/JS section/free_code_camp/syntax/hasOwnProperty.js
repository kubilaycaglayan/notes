function checkObj(obj, checkProp) {
  // Only change code below this line
  if (obj.hasOwnProperty(checkProp)) {
    console.log("Here")
    return obj[checkProp]
  }
  return "Change Me!";
  // Only change code above this line
}


a = checkObj({gift: "pony", pet: "kitten", bed: "sleigh"}, "gift") 
console.log(a)
//should return "pony".

a = checkObj({gift: "pony", pet: "kitten", bed: "sleigh"}, "pet") 
console.log(a)
//should return "kitten".

a = checkObj({gift: "pony", pet: "kitten", bed: "sleigh"}, "house") 
console.log(a)
//should return "Not Found".

a = checkObj({city: "Seattle"}, "city") 
console.log(a)
//should return "Seattle".

a = checkObj({city: "Seattle"}, "district") 
console.log(a)
//should return "Not Found".
