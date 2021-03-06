! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: math.parser kernel sequences prettyprint math ;
IN: hanoi


: move ( a b -- str )
  [ number>string ] bi@
  " vers " glue ;


: other ( a b -- o )
  { 1 2 3 } remove remove last ;

: partial ( a b -- a b' )
  over other ;


: hanoi ( d a n -- ) ! d depart, a arrivee (entre 1 et 3); n nombre de tours
  dup 1 =  
    [ drop move . ]   ! [ [ move ] dip ]
    [ 1 - 3dup [ partial ] dip hanoi    ! move smaller pieces to intermediate pole
      3dup drop move .                  ! move largest piece to destination
      [ swap partial swap ] dip hanoi ] ! move smaller pieces to destination
  if ;
