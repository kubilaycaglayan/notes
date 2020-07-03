//const stampit = require('@stamp/it')

//let Stamp = stampit() // creates new stamp

console.log(kubi)
console.log(awesome.concat(kubi))


const Logger = stampit({
  methods: {
    debug(str) {
      console.log(str)
    }
  }
})

const logger = Logger()

logger.debug('Server started')