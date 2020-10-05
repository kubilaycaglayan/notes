var p = new Promise( function(resolve,reject){
	foo.bar();	// `foo` is not defined, so error!
	resolve( 42 );	// never gets here :(
} );

p.then(
  function fulfilled(){
    console.log('asd')
		// never gets here :(
	},
	function rejected(err){
    console.log(err.message)
		// `err` will be a `TypeError` exception object
		// from the `foo.bar()` line.
	}
).catch(
  console.log('herE?')
);