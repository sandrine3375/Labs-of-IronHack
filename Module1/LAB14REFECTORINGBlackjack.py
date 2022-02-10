#!/usr/bin/env python
# coding: utf-8

# In[11]:


import random



def deal_card(cards_list):
    """Function do deal cards"""
    random_index = random.randint(0, len(cards) - 1)
    random_card = cards[random_index]
    # append new card to deck
    cards_list.append(random_card)
    # If an ace is dealt and score is over 21, replace the 11 with a 1
    if sum(cards_list) > 21 and random_card == 11:
        random_card -= 10
        cards_list[-1] = 1


cards = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
player_cards = []  # player's cards list
dealer_cards = []  # dealer's carts list

choice = input("Do you want to play blackjack? 'y' or 'n': ")  # Prompting the player to play a game of BlackJack

if choice == "y":

    deal_card(player_cards)  # 2*deal of card
    deal_card(player_cards)
    deal_card(dealer_cards)  # only one deal of card for the dealer
    print(f"    Your cards: {player_cards}")
    print(f"    Dealer's cards: {dealer_cards}")
    player_score = sum(player_cards)
    dealer_score = sum(dealer_cards)

    if player_score == 21 :
        print("BlackJack! You win!")
    elif dealer_score == 21 :
        print("The dealer has a BlackJack! You lost!")
        
    else:  # if no blackjack, the game is going on

        playing_player = True  # the player starts playing
        while playing_player:  # first, the user/player is playing
            # first, the user/player is playing
            keep_playing = input('Do you want to continue? "y" or "n": ')  # be dealt another card

            if keep_playing == "y":  # the player wishes to keep playing

                deal_card(player_cards)
                player_score = sum(player_cards)            
                print(f"    Your cards: {player_cards}")
                print(f"    Dealer's cards {dealer_cards}")
                ####

                if player_score < 21:  # in this case, loop is going on, we ask again "do yu want to continue"
                    continue

                elif player_score == 21:  # in this case, loop stops, player wins
                    print("You scored 21! You win!")
                    playing_player = False

                else:  # in case the player's score is greater than 21
                    print("Dealer wins, you scored more than 21.")
                    playing_player = False

            else:  # dealer is playing because the player said "n" (not playing)

                playing_player = False
                dealer_playing = True  # While the dealer's score is less than 17, he keeps playing
                while dealer_playing:
                
                    deal_card(dealer_cards)
                    dealer_score = sum(dealer_cards)
                    print(f"    Dealer's cards {dealer_cards}, score: {dealer_score}")

                    if dealer_score == 21:
                        print("The dealer scored 21! You lose!")
                        dealer_playing = False
                    elif dealer_score > 21:
                        print("The dealer has more than 21! You win!")
                        dealer_playing = False
                    elif dealer_score > player_score:  # Checking whether the dealer's score is greater than the
                            # player's, in which case the dealer wins and the game is over
                        dealer_playing = False
                        print("Dealer wins! You lose :-(")
                    elif player_score < 17:  # in this case, loop is going on, we ask again "do yu want to continue"
                        continue

                        


# In[ ]:




