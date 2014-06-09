! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: math.primes.factors math.parser math.primes kernel math sequences assocs ;
IN: engrammes
ERROR: malformed ;

: >engramme ( n -- str )
   "" swap 
   dup 2 < 
      [ number>string ]
      [ group-factors dup last first primes-upto    ! stack has array with decomposition and vector with useful prime numbers
         [ dup empty? not ]
            [ unclip [ over ] dip swap at 0 or engramme swap [ swap [ append ] dip ] dip ]
         while
         2drop "(" ")" surround ]        ! extract-powers 2drop "(" ")" surround ]
   if ;

: extract-powers (  -- x )
   [ dup empty? not ]
   [ unclip [ over ] dip swap at 0 or number>string swap [ swap [ append ] dip ] dip ] ! [ unclip [ over ] dip swap at 0 or engramme swap [ swap [ append ] dip ] dip ]
   [ while ] curry curry ; 

: engramme> ( str -- n )
   ;

: parse ( str -- engramme )
   ;
