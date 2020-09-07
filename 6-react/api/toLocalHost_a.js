const fetch = require('node-fetch');

// const url = "https://www.google.com"
const url = "http://localhost:3000/users"

fetch(url)
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

/*
RESPONSE
[
  { name: 'kubilay', id: 1 },
  { name: 'relative32', id: 2 },
  { name: 'apple', id: 3 },
  { name: 'thunderbolt', id: 4 },
  { name: 'bright!', id: 5 },
  { name: 'knowthy', id: 6 },
  { name: 'radi woman', id: 7 },
  { name: 'revolate', id: 8 },
  { name: 'sphere', id: 9 },
  { name: 'alo', id: 10 },
  { name: 'aristo', id: 11 },
  { name: 'pshycology majest', id: 12 }
]
 */