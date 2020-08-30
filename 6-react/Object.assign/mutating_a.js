const kubilay = {
  name: 'Kubilay',
  score: 92,
}

const newKubilay = Object.assign({}, kubilay, {score: 82}) // kubilay object remains the same
console.log(newKubilay)
console.log(kubilay)

const newKubilay2 = Object.assign(kubilay, {score: 82}) // the first object itself is mutated
console.log(newKubilay2)
console.log(kubilay)