const PubSub = require('PubSub');

const pubsub = new PubSub();

const onUserAdd = pubsub.subscribe('user_add', (data, topic) => {
  console.log('User added');
  console.log('user data:', data);
  console.log(topic);
});

const published = pubsub.publish('user_add', {
  firstName: 'John',
  lastName: 'Doe',
  email: 'johndoe@gmail.com',
});

console.log(onUserAdd);
console.log(published);
