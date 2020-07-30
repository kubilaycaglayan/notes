var globalTitle = " Winter Is  Coming";
console.log('global :', '\'',  globalTitle, '\'')

// Only change code below this line
function urlSlug(title) {
  var result = title.split();
  return result[0].trim().toLowerCase().split(/\s+/).join('-')
}
// Only change code above this line

console.log(urlSlug(globalTitle))
console.log('global :', '\'',  globalTitle, '\'')