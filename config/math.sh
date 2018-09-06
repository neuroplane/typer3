#!/bin/bash
addition(){
  k=$(($RANDOM % 5 + 1))
  l=$(($RANDOM % 5 + 1))
  m=$(($k + $l))
}

substraction(){
  k=$(($RANDOM % 5 + 1))
  l=$(($RANDOM % 5 + 1))
  m=$(($k - $l))
}

multiplication(){
  k=$(($RANDOM % 5 + 1))
  l=$(($RANDOM % 5 + 1))
  m=$(($k * $l))
}

division(){
  k=$(($RANDOM % 5 + 1))
  l=$(($RANDOM % 5 + 1))
  m=$(($k \ $l))
}
