import random

while True:
    player_action = input("Rock paper scissors: ")
    possible_action = ['rock', 'paper', 'scissors']
    computer = random.choice(possible_action)
    print(f"\nYou chose {player_action}, computer chose {computer}.\n")

    if player_action == computer:
        print(f"You both chose {player_action}. It's a draw!")

    elif player_action == "rock":
        if computer == "scissors":
            print("Rock smashes scissors! You win!")
        else:
            print("Paper covers rock! You lose.")

    elif player_action == "paper":
        if computer == "rock":
            print("Paper covers rock! You win!")
        else:
            print("Scissors cuts paper! You lose.")
    
    elif player_action == "scissors":
        if computer == "paper":
            print("Scissors cuts paper! You win!")
        else:
            print("Rock smashes scissors! You lose.")
        
    play_again = input("Play again? (y/n): ")
    if play_again.lower() != "y":
        break
