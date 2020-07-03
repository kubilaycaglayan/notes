const whoAmI = (name, height) => {
  const whoIs = () => {
    console.log(`I am ${name}`)
  };
  return { name, height, whoIs}
}

const kubil = whoAmI('Kubilay', 187)

console.log(kubil.name)
console.log(kubil.height)
console.log(kubil)
kubil.whoIs()

console.log('_____')
const yasin = whoAmI('Yasin', 188)

console.log(yasin.name)
console.log(yasin.height)
console.log(yasin)
yasin.whoIs()
console.log('_____')
kubil.whoIs()
