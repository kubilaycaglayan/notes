async function f() {
  let promise = new Promise((resolve, reject) => {
    setTimeout(() => resolve('done!'), 500)
  })
  let result = await promise
  console.log('inside async function:', promise)
  console.log('inside async function:', result)
}

f()

let promise2 = new Promise((resolve, reject) => {
  resolve('Holaa!')
})

let word = promise2
console.log('non async function:', promise2)
console.log('non async function:', promise2)