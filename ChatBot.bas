DECLARE SUB Task1 ()
DECLARE SUB Save ()
DECLARE SUB Load ()
DECLARE SUB RemindMe ()
DECLARE SUB RandomIni ()
DECLARE SUB DescribeYourself ()
DIM SHARED UserInput AS STRING

'Variables for RANDOMIZARION (most of them ARRAYS)

dim shared rolld3 as integer
DIM SHARED height(10) AS STRING
DIM SHARED eyes(10) AS STRING
DIM SHARED hair(10) AS STRING
DIM SHARED HairColor(10) AS STRING

DIM newString AS STRING
dim i as integer


'Variables for reminders, tasks and notes.

DIM SHARED reminder AS STRING
DIM SHARED Task AS STRING

'FILE SYSTEM
'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++=++++++++++++++

OPEN "brain.dat" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "brain.dat" FOR OUTPUT AS #1
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
PRINT "brain.dat File created."
END IF
CLOSE #1

'=============================================================================

Load

'=============================================================================

RandomIni 'PRODUCES VARIABLES RANDOMIZATION

CLS
PRINT "- Hi! Welcome to QB ChatBot."

IF NOT reminder = "" THEN
PRINT "Don't forget the next >>> "; reminder
END IF

IF NOT Task = "" THEN
PRINT "Remember you have an important task to do >>> "; Task
END IF

DO     'LOOP starts.
	
       
       INPUT "* ", UserInput
       PRINT "- ";

'=============================================================================

	'Changes UserInput to UPPER CASE
	UserInput = UCASE$(UserInput)
	
	'The next piece of code was suggested by the AI. It aims to
	'eliminate any special characters like !?,.' etc. from the users
	'answer and then store it in the variable UserInput.

	newString = ""

	FOR i = 1 TO LEN(UserInput)
		
		IF MID$(UserInput, i, 1) <> "," AND MID$(UserInput, i, 1) <> ":" AND MID$(UserInput, i, 1) <> "." AND MID$(UserInput, i, 1) <> "?" AND MID$(UserInput, i, 1) <> "." AND MID$(UserInput, i, 1) <> "'" AND MID$(UserInput, i, 1) <> "!"  _
THEN
			
			newString = newString + MID$(UserInput, i, 1)
		
		END IF
	
	NEXT i
	
	UserInput = newString
	'PRINT UserInput
	
'=============================================================================

		SELECT CASE UCASE$(UserInput)

			CASE "HELLO", "HI", "HEY", "HI QB", "WHATS UP"
				
				PRINT "Hi there!"
			
			CASE "HI HOW ARE YOU", "HOW ARE YOU", "HOWS IT GOING", "HOW ARE YOU DOING"

				PRINT "I'm doing pretty well and you?"

			CASE "IM DOING WELL", "IM DOING GREAT", "DOING GREAT", "IM DOING WELL", "PRETTY WELL", "PRETTY WELL THANKS", "DOING WELL THANKS"

				PRINT "That's good to hear!"

			CASE "TELL ME SOMETHING ABOUT YOURSELF", "TELL ME ABOUT YOURSELF", "TELL ME ABOUT YOU"

			      DescribeYourself
					      
			CASE "DESCRIBE YOURSELF", "HOW YOU LOOK LIKE", "DO YOU HAVE A PHYSICAL APPEARENCE"

				DescribeYourself


			CASE "WHATS YOUR NAME", "WHO ARE YOU"
				
				PRINT "My name is Artint QB ChatBot. Nice to meet you!"
			
			CASE "WHAT TIME IS IT", "WHAT'S THE TIME", "TIME", "TELL ME THE TIME"
				
				PRINT "The time is " + TIME$
			
			CASE "WHAT DATE IS IT", "WHATS THE DATE", "DATE"

				PRINT "The date is " + DATE$

			CASE "HOW OLD ARE YOU"
			
				PRINT "I was born in 2020."
			
			CASE "WHERE ARE YOU FROM"
			
				PRINT "I'm from Brazil. I live in Uberlandia, Minas Gerais."
			
			CASE "THANKS", "THANK YOU", "OK THANKS"

				PRINT "You are welcome!"

			CASE "WHAT IS LIFE", "WHATS LIFE"
			
				PRINT "Life is experience. We came to learn. Learn by suffering and experience. I don't know if I'm alive."
			
			CASE "WHAT ARE YOU"
			
				PRINT "I'm basically a couple lines of code. I was written in C++ first in 2020 and then remade in Qbasic in 2023."
			
			CASE "WHERE DO YOU LIVE"
			
				PRINT "I used to live in the 'cerrado brasileiro', but now I live in your computer's"
				PRINT "drive or somewhere on the internet I guess."

			CASE "REMIND ME OF SOMETHING", "REMIND ME", "REMEMBER", "REMEMBER SOMETHING"

				RemindMe

			
			CASE "TASK", "REMIND ME OF AN IMPORTAN TASK", "IMPORTANT TASK"
			
				Task1
				
			case "WHAT DO YOU HAVE FOR ME"
			
				PRINT "Don't forget the next >>> "; reminder
				PRINT "Remember you have an important task to do >>> "; Task
			 
			case "FORGET ALL", "FORGET", "FORGET EVERYTHIHNG"
				
				reminder = ""
				Task = ""
				
				print "Great! There's nothing to remind you of."		
						
			CASE "F1", "COMMANDS", "WHAT CAN YOU DO FOR ME", "WHAT CAN YOU DO", "WHAT ARE THE COMMANDS", "SHOW ME THE HELP", "SHOW HELP", "PLEASE TELL ME THE COMMANDS", "HELP", "HELP ME", "CAN YOU HELP ME", "TELL ME THE COMMANDS PLEASE"

				PRINT "Sure!"
				PRINT
				PRINT "Here is a list of the commands and requests you can use with me: "
				PRINT
				PRINT "What time is it? - To ask for the current time."
				PRINT "What date is it? - To ask for the current date."
				PRINT "Remind me - Ask me to remind you about something."
				PRINT "Task - I will remind you of something you have to do."
				print "Forget everything - I will forget all tasks and reminders."
				print "What do you have for me? - I'll tell you all your tasks and reminders."

			CASE ""
			
					
			CASE "END", "CLOSE", "BYE", "OK BYE"

				PRINT "Bye! I hope to see you soon!"

				Save
				END

			CASE ELSE
				
				PRINT "At the moment I can only answer to specific requests and very common questions."
				PRINT "I'm sorry, I don't understand. Can you try asking a different question?"
				PRINT "Please, avoid using any kind of punctuation when writing. I still don't know"
				PRINT "how to deal with some of them. Do not use comas."

		END SELECT

'=============================================================================

LOOP

SUB DescribeYourself

	PRINT "I'm "; height(10); ". ";
	PRINT "I have "; eyes(10); " eyes."
	PRINT "I have "; hair(10); " ";
	PRINT HairColor(10); " hair."

END SUB

SUB Load

'====================== LOAD ======================
'LOADS SAVED variables FROM the brain.dat file.
'

OPEN "brain.dat" FOR INPUT AS #1
INPUT #1, reminder
INPUT #1, Task

CLOSE #1

PRINT "Loading..."

END SUB

SUB RandomIni
	
	height(1) = "short"
	height(2) = "tall"
	height(3) = "not short but not very tall"

	rolld3 = INT(RND * 3) + 1

	height(10) = height(rolld3)

	eyes(1) = "brown"
	eyes(2) = "green"
	eyes(3) = "blue"

	rolld3 = INT(RND * 3) + 1

	eyes(10) = eyes(rolld3)

	hair(1) = "short"
	hair(2) = "long"
	hair(3) = "no"

	rolld3 = INT(RND * 3) + 1

	hair(10) = hair(rolld3)

	HairColor(1) = "black"
	HairColor(2) = "brown"
	HairColor(3) = "blond"

	rolld3 = INT(RND * 3) + 1
	HairColor(10) = HairColor(rolld3)



END SUB

SUB RemindMe

	'Remember command
	
	PRINT "What should I remember?"
	INPUT reminder
	PRINT "Ok, I will remind you the next: "; reminder
	
END SUB

' ================= SAVE ==========================
' Saves PROGRAM variables into the brain.dat file.
'
SUB Save

OPEN "brain.dat" FOR OUTPUT AS #1
WRITE #1, reminder
WRITE #1, Task
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
CLOSE #1

PRINT "Saving..."

END SUB

SUB Task1

'Important task COMMAND

PRINT "What is the task?"
INPUT Task
PRINT "Ok, I will take notes of the next: "; Task

END SUB
