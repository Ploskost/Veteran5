#!/bin/bash

sendRequest ()
{
  # Add regex for more...
  curl "https://www.$1.com" &>/dev/null
  if [ $? = 0 ]
  then
    echo "OK"
  else
    echo "Not OK"
  fi

}

isAlive ()
{
  response=`ping -c 9 -q "$1.com" 2> /dev/null | grep '[[:digit:]] received' | cut -d " " -f4`
  if [[ $response > 4 ]]
  then
    echo "Sending requset..."
    sendRequest $1
  else
    echo "Somthing went wrong"
  fi
}

read -p "Enter domain name:" domain
isAlive $domain
