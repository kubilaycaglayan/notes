const fetch = require('node-fetch');

const id = "20"
const url = `http://localhost:3000/users/${id}`

fetch(url, {
  method: 'DELETE',
})
.then(
  response => {
    console.log('RESPONSE', response)
  }
)
.catch(
  err => {
    console.log('ERROR', err)
  }
)

