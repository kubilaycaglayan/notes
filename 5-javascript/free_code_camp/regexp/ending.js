let theEnding = "This is a never ending story";

let storyRegex = /story$/;
result = storyRegex.test(theEnding);
// Returns true
console.log(result)

let noEnding = "Sometimes a story will have to end";
result = storyRegex.test(noEnding);
// Returns false
console.log(result)
