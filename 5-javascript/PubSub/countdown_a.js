const PubSub = require('PubSub');

const afterCountDown = (data) => {
  console.log(`everyting is over in ${data.num} seconds`);
}

function back(num) {
  let start = num;
  return () => {
    if (start === 0) {
      pubsub.publish('count', { num });
      clearInterval(int);
    }
    console.log(start);
    start -= 1;
  }
}

counter = back(2);


var pubsub = new PubSub();

var onFinish = pubsub.subscribe('count', (data, topic) => {
  afterCountDown(data);
});

const int = setInterval(() => {
  counter();
}, 1000)
