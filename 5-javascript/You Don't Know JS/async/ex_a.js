doA( function(){
  console.log('A')
	doC();

	doD( function(){
    console.log('D')
		doF();
	} )

	doE();
} );

doB();