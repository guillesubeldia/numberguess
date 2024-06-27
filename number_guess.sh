#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
# Check if the user exists
USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")



if [[ -z $USER_INFO ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" > /dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate the secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

GUESS_COUNT=0

while true; do
  read GUESS
  ((GUESS_COUNT++))

  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done
# Update user stats
$PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID" > /dev/null
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")
if [[ -z $BEST_GAME ]] || [[ $GUESS_COUNT -lt $BEST_GAME ]]; then
  $PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE user_id = $USER_ID" > /dev/null
fi

# Log the game
$PSQL "INSERT INTO games(user_id, guesses, secret_number) VALUES($USER_ID, $GUESS_COUNT, $SECRET_NUMBER)" > /dev/null


