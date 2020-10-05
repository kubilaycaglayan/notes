Array.prototype.kubilay = function () {
  console.log('Sevimli kedi Kubilay...')
}

result = Object.getOwnPropertyNames(Array.prototype)

console.log(result)

result = Array.prototype.kubilay()

console.log(result)