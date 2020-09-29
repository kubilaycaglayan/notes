const number = new Promise( function(resolve, reject){
  resolve(10)
})

number
.then(
  res => {
    console.log(res)
  }
)