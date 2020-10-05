let twinkleStar = "Twinkle, twinkle, little star";
let starRegex = /twinkle/ig; // Change this line
let result = twinkleStar.match(starRegex); // Change this line

// i => turn off case sensitivity, g => extract repeating ones too

console.log(result)