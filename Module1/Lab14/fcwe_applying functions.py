#!/usr/bin/env python
# coding: utf-8

# In[1]:


#defining function for visual add on
def life_function(lll):
    if lll == 12:
        print("   __    \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "__|__\n")
    elif lll == 11:
        print("   ___   \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "__|__\n")
    elif lll == 10:
        print("   ____  \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "__|__\n")
    elif lll == 9:
        print("   _____ \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "  |      \n"
              "__|__\n")
    elif lll == 8:
        print("   _____  \n"
              "  |     | \n"
              "  |       \n"
              "  |       \n"
              "  |       \n"
              "  |       \n"
              "  |       \n"
              "__|__\n")
    elif lll == 7:
        print("   _____  \n"
              "  |     | \n"
              "  |     | \n"
              "  |       \n"
              "  |       \n"
              "  |       \n"
              "  |       \n"
              "__|__\n")
    elif lll == 6:
        print("   _____  \n"
              "  |     | \n"
              "  |     | \n"
              "  |     | \n"
              "  |       \n"
              "  |       \n"
              "  |       \n"
              "__|__\n")
    elif lll == 5:
        print("   _____   \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     O  \n"
              "  |        \n"
              "  |        \n"
              "__|__\n")
    elif lll == 4:
        print("   _____   \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     O  \n"
              "  |    /   \n"
              "  |        \n"
              "__|__\n")
    elif lll == 3:
        print("   _____   \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     O  \n"
              "  |    /|  \n"
              "  |        \n"
              "__|__\n")
    elif lll == 2:
        print("   _____   \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     O  \n"
              "  |    /|\ \n"
              "  |        \n"
              "__|__\n")
    elif lll == 1:
        print("   _____   \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     |  \n"
              "  |     O  \n"
              "  |    /|\ \n"
              "  |    /   \n"
              "__|__\n")
    elif lll == 0:
        print("   _____  \n"
              "  |     | \n"
              "  |     | \n"
              "  |     | \n"
              "  |     O \n"
              "  |    /|\ \n"
              "  |    / \ \n"
              "__|__\n")
               


# In[8]:


#user 1 inputs word and check if inputted string is number or word

x = input("Player 1: Please enter your word: ")
flag1 = False
def input_check(x):
    flag1 = False
    while flag1 == False:
        if x.strip().isdigit() == False:
            return(str(x))
            flag1 = True
        else:
            x = input("Error: Please enter a !WORD/LETTERS!: ")
            
            
x = input_check(x)       
#create maximum length of word  
flag1 = False
while flag1 == False:
    if len(x) <= 26:
        break
    else:
        x = input("Error: Please enter a word with maximum length of 26 letters: ")
        flag1 = True
        
x = x.lower()

# split the word into a list consisting of the words letter

import re
lst_of_og_letters = re.findall(r"[a-z]",x)


# In[9]:


# create a second list of x
l=list(x)

#create an empty dictionary
d=dict()

#turning the list of letters into a set --> only unique values saved here, in case of double letters, only one letter present
cl = set(l)

#creating a list, which consists out of the postions of the letters in the word
answers_position_list=list(range(0, len(l)))

#for the unique values of the word(in set) we know want to find the position of this value in the letter, and add this relationship in form of a key value pair (character:position) into the dictionary
for c in cl:
    lst =[]
    for pos,char in enumerate(x):
        if(char == c):
            lst.append(pos)
            d[c]=lst


# In[10]:


#we know prepare the input of the second player: the number of possible tries is set to = 12, a list for input letters is created
life = 12 
lst_of_input_letters = []

#a while loop is set up to make the game continue, ask user 2 for new letters until the game is either won or lost
while life > 0 and lst_of_og_letters != answers_position_list:
        #input of user 2 and check if word or number
        y = input("Player 2: Please enter a letter: ")
        y = input_check(y)
        y = y.lower()
        
        #now we make conditional checks to see if input letter is in word, not in word, or has already been used and apply the consequences according to the rules of the game
        if y in lst_of_og_letters and y not in lst_of_input_letters:
            lst_of_input_letters.append(y)
            
            for i in d[y]: #we do this in case there are multiple positions for one letter, to assign letter to all positions saved in list of letter key of d
                answers_position_list[i]=y #then replace the position/positions with letter y 
                print(answers_position_list)   
        elif y not in lst_of_og_letters and y not in lst_of_input_letters:
            lst_of_input_letters.append(y)
            life_function(life)
            print(y, "is .... not in the word :)")
            life -= 1
            print("You have", life, "lives left!!")
        elif y in lst_of_input_letters:
            print("letter has already been used")
#ast step: we reach this point when while loop has broken, that means either one of the players has now won, results are then printed       
if life == 0:
    life_function(0)
    print("PLAYER 1 WINS!!")
elif answers_position_list == lst_of_og_letters:
    print("PLAYER 2 WINS!!")   


# In[ ]:





# In[ ]:





# In[ ]:




