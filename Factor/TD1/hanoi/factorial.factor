

: fact ( n -- x ) 
	dup 2 <
		[ drop 1 ] 
		[ dup 1 - fact * ]
	if ;

