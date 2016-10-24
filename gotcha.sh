#!/bin/bash
DRAGON_COUNT=15
TURN_MAX_TAKE=3
TURN_COUNT=0

print_info () {
   echo "Dragon Count: $DRAGON_COUNT"
   echo "Turn Count: $TURN_COUNT" 
}

get_user_take () {
   read -p "How many dragons would you like to take? " TAKE
   if (( $TAKE < 1 || $TAKE > $TURN_MAX_TAKE )); then
     echo "Invalid number to take: $TAKE" 
     get_user_take
   elif (( $DRAGON_COUNT - $TAKE < 0 )) ; then
     echo "There aren't that many dragons"
     get_user_take
   else
     DRAGON_COUNT=$((DRAGON_COUNT-$TAKE))
   fi
}

next_turn () {
  TURN_COUNT=$((TURN_COUNT + 1))
  echo "End of Turn"
}

echo "START GAME"
while (( $DRAGON_COUNT > 0 ));
do
  if (( $TURN_COUNT % 2 == 0 )) ; then
    echo ".==========================."
    echo "|         PLAYER 1         |"
    echo "'=========================='"
    print_info
    get_user_take
  else
    echo ".==========================."
    echo "|         PLAYER 2         |"
    echo "'=========================='"
    print_info
    get_user_take
  fi
  next_turn
done
echo "GAME OVER"
exit 0;
