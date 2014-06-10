! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: math.primes.factors math.parser math.primes kernel math sequences assocs ;
IN: engrammes
DEFER: >engramme-recursive
ERROR: malformed ;

: >engramme ( n -- str )
   "" swap >engramme-recursive swap drop ;

: >engramme-recursive ( x x -- x x )
   dup group-factors swap
   dup 2 < 
      [ swap drop number>string ]
      [ swap dup last first primes-upto    ! stack has array with decomposition and vector with useful prime numbers
         [ dup empty? not ]
            [ unclip [ over ] dip swap at 0 or >engramme swap [ swap [ swap [ append ] dip ] dip ] dip ]
         while
         2drop swap "(" ")" surround ]
   if ;

: engramme> ( str -- n )
   ;

: parse ( str -- engramme )
   ;

