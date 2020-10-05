var contacts = [{
    "firstName": "Akira",
    "lastName": "Laine",
    "number": "0543236543",
    "likes": ["Pizza", "Coding", "Brownie Points"]
  },
  {
    "firstName": "Harry",
    "lastName": "Potter",
    "number": "0994372684",
    "likes": ["Hogwarts", "Magic", "Hagrid"]
  },
  {
    "firstName": "Sherlock",
    "lastName": "Holmes",
    "number": "0487345643",
    "likes": ["Intriguing Cases", "Violin"]
  },
  {
    "firstName": "Kristian",
    "lastName": "Vos",
    "number": "unknown",
    "likes": ["JavaScript", "Gaming", "Foxes"]
  }
];

/*     console.log(contacts[i].firstName)
    console.log(contacts[i].hasOwnProperty(prop)) */

function lookUpProfile(name, prop) {
  // Only change code below this line
  for (var i = 0; i < contacts.length; i++) {
    if (contacts[i].firstName == name && contacts[i].hasOwnProperty(prop)) {
      return contacts[i][prop]
    } else if (contacts[i].firstName == name) {
      if (!contacts[i].hasOwnProperty(prop)) {
        return "No such property"
      } else {
        return "No such contact"
      }
    }
  }
  return "No such contact"
}
// Only change code above this line

result = lookUpProfile("Kristian", "lastName");
console.log(result)