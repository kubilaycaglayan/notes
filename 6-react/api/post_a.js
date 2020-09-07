const fetch = require('node-fetch');

const name = "Jamiliaaa"
const age = "27"
const url = `http://localhost:3000/users?name=${name}&age=${age}`

fetch(url, {
  method: 'POST',
})
.then(
  response => {
    console.log('RESPONSE')
    return response.json();
  }
)
.then(
  data => console.log(data)
)
.catch(
  err => {
    console.log('ERROR', err)
  }
)

