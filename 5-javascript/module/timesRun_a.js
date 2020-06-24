const CountExecution = (function CountExecution() {
  let runTime = 0;
  const runForest = function runForest() {
    console.log('Forest is running...');
    runTime++;
  };
  return {
    getRunTime: function getRunTime() {
      return console.log(runTime);
    },
    runForest,
    runTimee: runTime,
  };
}());

CountExecution.runForest();
CountExecution.runForest();
CountExecution.runForest();
console.log(CountExecution.runTimee);
CountExecution.runTimee = 5;
console.log(CountExecution.runTimee)
CountExecution.getRunTime();
