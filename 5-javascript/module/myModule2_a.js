const meAgain = (function moduleSet() {
  const feet = 2;
  const head = 1;
  const heart = true;

  const giveInfo = function giveInfo() {
    return `I have ${feet} feet, ${head} head and a ${heart ? 'good' : 'bad'} heart.`;
  };

  return {
    tellAbout: function tellAbout(value) {
      return giveInfo(value);
    },
  };
}());

console.log(meAgain.tellAbout());
