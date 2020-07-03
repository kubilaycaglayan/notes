// Setup
var collection = {
  2548: {
    album: "Slippery When Wet",
    artist: "Bon Jovi",
    tracks: [
      "Let It Rock",
      "You Give Love a Bad Name"
    ]
  },
  2468: {
    album: "1999",
    artist: "Prince",
    tracks: [
      "1999",
      "Little Red Corvette"
    ]
  },
  1245: {
    artist: "Robert Palmer",
    tracks: [ ]
  },
  5439: {
    album: "ABBA Gold"
  }
};

// Only change code below this line
function updateRecords(id, prop, value) {
  if (value == '') {
    delete collection[id][prop]  
  } else if (prop != 'tracks' && value!= '') {
    collection[id][prop] = value
  } else if (prop == 'tracks' && !collection[id].hasOwnProperty('tracks')) {
    var allTracks = [value]
    collection[id][prop] = allTracks
  } else if (prop == 'tracks' && collection[id].hasOwnProperty('tracks')) {
    collection[id][prop].push(value)
  }
  return collection;
}


console.log(2)
a = updateRecords(5439, "tracks", "Take a Chance on Me")
console.log(a)
console.log('\n\n\n')
//, tracks should have "Take a Chance on Me" as the last element.


console.log(4)
a = updateRecords(1245, "tracks", "Addicted to Love")
console.log(a)
console.log('\n\n\n')
//, tracks should have "Addicted to Love" as the last element.

console.log(5)
a = updateRecords(2468, "tracks", "Free")
console.log(a)
console.log('\n\n\n')
//, tracks should have "1999" as the first element.
