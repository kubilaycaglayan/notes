const kubilay = (function moduleSet() {
  const hair = 'black';
  const height = 187;
  function giveInformation() {
    console.log(`My hair is ${hair} and I am ${height}cm tall.`);
  }
  return {
    whoIs: function whoIs() {
      giveInformation();
    },
  };
}());

kubilay.whoIs();
