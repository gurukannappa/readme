#!/bin/sh

# the following variable is going to be used in the child shell script
var_ten=10
function parent_func(){
  echo "This is parent function and the value is $var_ten \n"
}