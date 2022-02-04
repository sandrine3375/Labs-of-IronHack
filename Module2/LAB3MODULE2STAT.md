![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Statistics Foundations
In this lab we are going to put into practice what we learned about the foundations of statistics. You won't need to use Python, just your brain and a little bit of *Markdown*. Hovewer, you will need SQL for the Part 3.

## Your task
Today you'll need to complete the challenges described below.

## Deliverables
You need to submit a markdown file with the solution to the following challenges. You can create a new *.md* file or directly edit the *README.md* to include your solutions.
This file should also include the SQL script for the Part 3.

## Challenges
## Part 1
### Challenge 1
Find a and b, if median=42, mean=50
20,34, 34,  12, 56, 110, 49, a, b.

315+a+b/9=50
a+b=135
median=42
a=42
b=135-42=93

### Challenge 2
A car hit an average speed of v1 = 60 kmph in the first half of the journey, and hit an average speed of v2 = 110 kmph in the second half of the journey. Determine the average speed of the car.

V1+V2/2=85

### Challenge 3
The lifetimes of 400 light-bulbs were found to the nearest hour. The results were recorded as
follows.
Lifetime (hours) 0–199 200–399 400–599 600–799 800–999 1000–1199 1200–1999
Frequency         143     97      64      51      14      14        17
Construct a histogram and cumulative frequency polygon for this dataset. Estimate the percentage
of bulbs with lifetime less than 480 hours.

480 hours, is in middle of 399 et 599... so I take 64/2=32
143+97+32=272
272/400 =68% pourcentage of blb less than 480 hours
### Challenge 4
The time between arrival of 60 patients at an intensive care unit were recorded to the nearest hour.
The data are shown below.
Time (hours) 0–19 20–39 40–59 60–79 80–99 100–119 120–139 140–159 160–179
Frequency     16    13    17    4     4      3       1      1       1
Determine the median, mean and standard deviation for this dataset.
Cumulative frequency: 16, 29, 46 50 54 57 58 59 60
median:
30th observation is a the third interval (40-59) 
l=40
N/2=30
F=29
h=20
f=17
MEDIAN=41,17

MEAN/
Mid value: 9, 29, 49, 69, 89, 109, 129, 149, 169
Mean: 144+377+833+276+356+327+129+149+169/60=46

standart deviation : 
Sum(freq*midpoint*midpoint)/N - mean*mean
=3447-2116=1331
soit 
import numpy as np
np.sqrt(1331)
36.4828726939094



## Part 2
### Challenge 1
One player rolls two dices. Describe the measurable space and the random variable for:
* A. The values that the player obtains.
* B. The sum of the values obtained.
* C. The maximum value obtained after rolling both dices.

A. 6*6 possibility {(1,1); (1,2), (1,3); (1,4), (1,5); (1,6)....}
B. {2,3,4,5,6,7,8,9,10,11,12}
C.6+6


Describe the following events:
* Case A: Both values are greater than 5.
(6,6)

* Case B: The sum of values is even.
(2,4,6,8,10,12,14,16,18,20,22,24)

* Case C: The maximum is the value of both rolls.
12

### Challenge 2
One player picks two cards from a poker deck. Describe the measurable space and the random variable for:
* A. The number of figures he picks.
1/52+ 1/51 - There are 52 cards in a poker game
* B. The sum of card values. Consider that the value of figures is 10 and the value of aces is 15.
10(10+1)/2 + 3*10 + 15= 100
* C. The number of hearts or spades he picks.
24/52 + ((24+23)/51)/2

Describe the following events:
* Case A: The number of figures in the cards the player picked is two.
a, b
* Case B: The sum of card values is 17.
a+b=17
* Case C: The value of both cards is less than 8.
a+b < 8

### Challenge 3
Two players roll a dice. Describe the measurable space and the random variable for:
* A. The score of player A.
range (1,6)

* B. The greatest score.
5 possibilties

* C. The earnings of player A if the game rules state that:  
"The player with the greatest score gets a coin from the other player."
player has 2*1/6 + 3*2/6 + 4*3/6 + 5*4/6 6*5/6 
* D. The earnings of player A if the game rules state that:  
"The player with the greatest score gets as many coins as the difference between the score of player A and player B."
 winners:range (2:6) - losser: range(1:5)

Describe the following events:
* Case A: The score of player A is 2.
1/- possibility
* Case B: The greatest score is lower or equal than 2.
2*2/6 =2/3
* Case C: Considering the case where the winner gets as many coins as the difference between scores (D), describe: 
  * Player A wins at least 4 coins.
(6,2) (6,1) (5,1) 
  * Player A loses more than 2 coins.
(1,4) (1,5) (1,6) (2,5) (2,6) (3,6) 
  * Player A neither wins nor loses coins.
(1,1) (2,2) (3,3) (4,4) (5,5) (6,6) 


## Bonus challenges
### Bonus Challenge 1
Three players take balls from a box. Inside that box there are red, blue, green and black balls. The players can take three balls at mosts with the following rules:

* If the ball is blue, they can take another ball.
* If the ball is green, they get one point and they can take another ball.
* If the ball is red, they can’t take another ball.
* If the ball is black, they lose one point and they can’t take another ball.

Describe the measurable space and the random variable for:
* A. Player A wins. Do not consider ties as a win.
(3,2,1) (3,1,2) (3,1,1) (3,0,1) (3,1,0) (2,1,1) (2,0,1) (2,1,0) (1,0,0)
* B. Player A and B get the same points.
(3,3,2) (3,3,1) (3,3,0) (2,2,3) (2,2,1) (2,2,0) (1,1,0) (1,1,2) (1,1,3)
* C. All players get 0 points.
(0,0,0) (1,-1,0) 
### Bonus Challenge 2
Consider the situation of bonus challenge 1 but now with four players. Does anything change in your solutions? What are the changes in each case?
(3,2,1,2) (3,2,1,1) (3,2,1,0) (3,1,2,0) (3,1,2,1) (3,1,2,2) (3,1,1,1) (3,1,1,0) (3,0,1,0) (3,0,1,2) (3,0,1,1) (3,1,0,0) (3,1,0,1)(3,1,0,2) (2,1,1,1) (2,1,1,0) (2,0,1,0) (2,0,1,1) (2,1,0,0) (2,1,0,1) (1,0,0,0) 
the prbability to have a winner combinaison is lower

### Bonus Challenge 3
One player takes three balls from a box. Inside the box there are 5 balls: two of them are black and the other three are white. 

Describe the measurable space and the random variable for:
* A. The number of white balls if every time we take a ball we keep it.
3/5+ (3+2/4)/2 + (3+2+1/4)/3
* B. The number of white balls if every time we take a ball we put it back again into the box.
(3/5)*3=9/5
* C. The number of black balls if every time we take a ball we keep it.
2/5+ (2+1/4)/2 + (2+1+0/4)/3
* D. The number of black balls if every time we take a ball we put it back into the box.
(2/5)*3=6/5

| Attempt | #1 | #2 |
| :---: | :---: | :---: |
| Seconds | 301 | 283 |

## Part 3
### Challenge 1

| #student_id | #score |
| :---------: | :----: |
| 1 | 91 |
| 2 | 72 |
| 3 | 98 |
| 4 | 62 |
| 5 | 62 |
| 6 | 95 |
| 7 | 83 |
| 8 | 86 |
| 9 | 56 |
|10 | 97 |
|11 | 58 |
|12 | 71 |
|13 | 87 |
|14 | 83 |
|15 | 98 |


MEAN : 79.93
MEDIAN : 86 (15+1/2)
STD: 14,69
variance:216
MIN/56
MAX/98
