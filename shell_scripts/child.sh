#!/bin/bash

source parent.sh

function child_func(){
  parent_func
  echo "This is the function in the child script and the value from parent variable: $var_ten \n"
}

child_func