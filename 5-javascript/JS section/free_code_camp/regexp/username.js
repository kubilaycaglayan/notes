usernames = [
  "JACK",
  "Jo",
  "RegexGuru",
  "BadUs3rnam3",
  "Z97",
  "007",
  "J"
]
/*1) Usernames can only use alpha-numeric characters.

2) The only numbers in the username have to be at the end. There can be zero or more of them at the end. Username cannot start with the number.

3) Username letters can be lowercase and uppercase.

4) Usernames have to be at least two characters long. A two-character username can only use alphabet letters as characters. */
// https://www.freecodecamp.org/forum/t/freecodecamp-challenge-guide-restrict-possible-usernames/301363

regexp = /^[a-z]([0-9][0-9]+|[a-z]+\d*)$/i;
console.log("\n\n\n\n")
for (var i = 0; i < usernames.length; i++) {
  var result = usernames[i].match(regexp)
  console.log(usernames[i], ":  ", result)
}
console.log("\n\n\n\n")