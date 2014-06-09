! Copyright (C) 2014 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test hanoi ;
IN: hanoi.tests

[ "1 vers 2" ] [ 1 2 move ] unit-test
[ "5 vers 8" ] [ 5 8 move ] unit-test
[ "-1 vers 0" ] [ -1 0 move ] unit-test

[ 1 ] [ 2 3 other ] unit-test
[ 1 ] [ 3 2 other ] unit-test
[ 2 ] [ 1 3 other ] unit-test
[ 2 ] [ 3 1 other ] unit-test
[ 3 ] [ 1 2 other ] unit-test
[ 3 ] [ 2 1 other ] unit-test

[ 1 3 ] [ 1 2 partial ] unit-test
[ 1 2 ] [ 1 3 partial ] unit-test
[ 2 1 ] [ 2 3 partial ] unit-test
[ 2 3 ] [ 2 1 partial ] unit-test
[ 3 1 ] [ 3 2 partial ] unit-test
[ 3 2 ] [ 3 1 partial ] unit-test

[
