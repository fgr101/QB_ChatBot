DECLARE SUB RNumber6 ()
DECLARE SUB ForgetReminders ()
DECLARE SUB ShowReminders ()
DECLARE SUB ShowTasks ()
DECLARE SUB ForgetTasks ()

DECLARE SUB RNumber3 ()
DECLARE SUB RNumber10 ()
DECLARE SUB WriteTasks ()
DECLARE SUB Save ()
DECLARE SUB Load ()
DECLARE SUB RemindMe ()
DECLARE SUB RandomIni ()
DECLARE SUB DescribeYourself ()
DIM SHARED UserInput AS STRING

'Variables for RANDOMIZARION (most of them ARRAYS)

DIM SHARED D3 AS INTEGER
DIM SHARED D6 AS INTEGER
DIM SHARED D10 AS INTEGER

DIM SHARED height(10) AS STRING
DIM SHARED eyes(10) AS STRING
DIM SHARED hair(10) AS STRING
DIM SHARED HairColor(10) AS STRING

DIM newString AS STRING
DIM i AS INTEGER

DIM SHARED counter AS INTEGER
DIM SHARED TaskNumber AS INTEGER
DIM SHARED ReminderNumber AS INTEGER

'Variables for reminders, tasks and notes.

DIM SHARED Reminder(10) AS STRING
DIM SHARED Task(10) AS STRING

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


TaskNumber = 0
ReminderNumber = 0

'=============================================================================

Load

'=============================================================================

RandomIni 'PRODUCES VARIABLES RANDOMIZATION

RANDOMIZE TIMER

COLOR 7

CLS
PRINT "- Hi! Welcome to QB ChatBot. Type HELP to see all the commands."
PRINT "Important: DO NOT use commas when writing."
IF NOT Reminder(ReminderNumber) = "" THEN

ShowReminders

END IF

IF NOT Task(TaskNumber) = "" THEN

	ShowTasks

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
				
			CASE "ROLL A DIE", "ROLL A D6", "ROLL A D6 PLEASE", "D6", "PLEASE ROLL A D6", "CAN YOU ROLL A D6 PLEASE", "CAN YOU ROLL A D6", "GIVE ME A D6"
			
				RNumber6
				PRINT "Sure I can do that! ... The D6 DIE shows a "; D6

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
			
				WriteTasks
				
			CASE "WHAT DO YOU HAVE FOR ME"
			

				IF Reminder(1) = "" AND Reminder(2) = "" AND Reminder(5) = "" AND Reminder(7) = "" THEN

					PRINT "I don't have any reminders for you."

				ELSE

				ShowReminders

				END IF

				IF Task(1) = "" AND Task(2) = "" AND Task(3) = "" AND Task(5) = "" AND Task(7) = "" THEN

					PRINT "I don't have any tasks for you."

				ELSE
				
				ShowTasks

				END IF


			CASE "FORGET REMINDER"
			
				ForgetReminders
				PRINT "Right! I forgot the reminders."
				
			CASE "FORGET TASKS", "FORGET TASK"
			
				ForgetTasks
				PRINT "Right! I forgot the tasks."
			
			CASE "FORGET ALL", "FORGET", "FORGET EVERYTHIHNG"
				
				ForgetReminders
				ForgetTasks
				
				PRINT "Great! There's nothing to remind you of and no tasks for you to complete."

			CASE "F1", "COMMANDS", "WHAT CAN YOU DO FOR ME", "WHAT CAN YOU DO", "WHAT ARE THE COMMANDS", "SHOW ME THE HELP", "SHOW HELP", "PLEASE TELL ME THE COMMANDS", "HELP", "HELP ME", "CAN YOU HELP ME", "TELL ME THE COMMANDS PLEASE"

				PRINT "Sure!"
				PRINT
				PRINT "Here is a list of the commands and requests you can use with me: "
				PRINT
				PRINT "What time is it? - To ask for the current time."
				PRINT "What date is it? - To ask for the current date."
				PRINT "Remind me - Ask me to remind you about something."
				PRINT "Roll a D6 - I will roll a D6 DIE and give you the number."
				PRINT "Task - I will remind you of something you have to do."
				PRINT "Forget everything - I will forget all tasks and reminders."
				PRINT "Forget reminder - I will forget the reminder."
				PRINT "Forget task - I will forget the task."
				PRINT "What do you have for me? - I'll tell you about all your tasks and reminders."
				PRINT "I'm bored, what can I do? - I'll suggest you some random activity for you to do."
				PRINT "Bye - I will finish our conversation and close this program."
				PRINT

			CASE ""
			
			CASE "IM BORED WHAT CAN I DO", "WHAT CAN I DO", "IM BORED", "WHAT TO DO WHEN IM BORED", "WHAT TO DO WHEN BORED", "SUGGEST SOMETHING TO DO", "WHAT TO DO"
			
				RNumber10
				
				SELECT CASE D10
				
					CASE 1
					
					PRINT "Use your free time to read an insteresting book."
					
					CASE 2
					
					PRINT "Use your free time to workout and exercise a little."
					
					CASE 3
					
					PRINT "Use your free time to study something interesting that you like."
					
					CASE 4
					
					PRINT "Use your free time to watch a movie or tv series."
				
					CASE 5
					
					PRINT "Use your free time to go for a walk. You can take your dog with you if you have one."
				
					CASE 6
					
					PRINT "Use your free time to ride bike or go for a running."
					
					CASE 7
					
					PRINT "Use your free time to cook something, you could also drink some wine or make a coffee."
					
					CASE 8
					
					PRINT "Use your free time to relax and practice meditation. There are some good guided meditations available on the internet"
					
					CASE ELSE
					
					PRINT "Use your free time to send a message to a friend or someone in your family."
					
				END SELECT
				
					
			CASE "END", "CLOSE", "BYE", "OK BYE", "EXIT"

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

SUB ForgetReminders

counter = 0

DO UNTIL counter = 10

	Reminder(counter) = ""
	counter = counter + 1

LOOP

END SUB

SUB ForgetTasks

counter = 0

DO UNTIL counter = 10

	Task(counter) = ""
	counter = counter + 1

LOOP

END SUB

SUB Load

'====================== LOAD ======================
'LOADS SAVED variables FROM the brain.dat file.
'

OPEN "brain.dat" FOR INPUT AS #1

counter = 0  '================ LOADING REMINDERS

DO UNTIL counter = 10

	INPUT #1, Reminder(counter)
	counter = counter + 1

LOOP

counter = 0  '================ LOADING TASKS

DO UNTIL counter = 10

	INPUT #1, Task(counter)
	counter = counter + 1

LOOP

CLOSE #1

COLOR 9

PRINT
PRINT "Loading..."

END SUB

SUB Notes

' TO DO

' - The ChatBot is able to remember at least 10 different reminders for you.
' - The ChatBot is able to forget these 10 reminders.
' - The ChatBot tells you when there aren't any reminders for you.

' DONE

' - ChatBot able to roll a D6 and generate a random number from 1 to 6.
' - ChatBot able to remember at least 10 different tasks for you.
' - ChatBot able to forget these 10 tasks.
' - ChatBot tells you when there aren't any tasks for you.

END SUB

SUB RandomIni
	
	height(1) = "short"
	height(2) = "tall"
	height(3) = "not short but not very tall"

	RNumber3

	height(10) = height(D3)

	eyes(1) = "brown"
	eyes(2) = "green"
	eyes(3) = "blue"

	RNumber3

	eyes(10) = eyes(D3)

	hair(1) = "short"
	hair(2) = "long"
	hair(3) = "no"

	RNumber3

	hair(10) = hair(D3)

	HairColor(1) = "black"
	HairColor(2) = "brown"
	HairColor(3) = "blond"

	RNumber3

	HairColor(10) = HairColor(D3)



END SUB

SUB RemindMe

'Remember command
	
PRINT "What should I remember?"
INPUT Reminder(ReminderNumber)
PRINT "Ok, I will remind you the next: "; Reminder(ReminderNumber)
	
ReminderNumber = ReminderNumber + 1

IF ReminderNumber = 11 THEN

	ReminderNumber = 0

END IF

END SUB

SUB RNumber10

D10 = INT(RND * 10) + 1

END SUB

SUB RNumber3

D3 = INT(RND * 3) + 1

END SUB

SUB RNumber6

D6 = INT(RND * 6) + 1

END SUB

' ================= SAVE ==========================
' Saves PROGRAM variables into the brain.dat file.
'
SUB Save

OPEN "brain.dat" FOR OUTPUT AS #1

counter = 0 ' ======================== SAVING REMINDERS

DO UNTIL counter = 10

	WRITE #1, Reminder(counter)
	counter = counter + 1

LOOP

counter = 0 ' ======================== SAVING TASKS

DO UNTIL counter = 10

	WRITE #1, Task(counter)
	counter = counter + 1

LOOP

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

COLOR 9

PRINT
PRINT "Saving..."

END SUB

SUB ShowReminders

counter = 0

PRINT
PRINT "Don't forget the next >>> "
PRINT

DO UNTIL counter = 10

	IF NOT Reminder(counter) = "" THEN

		PRINT Reminder(counter)

	END IF

counter = counter + 1

LOOP

PRINT

END SUB

SUB ShowTasks

counter = 0

PRINT
PRINT "Remember you have some important tasks to do >>> "
PRINT

DO UNTIL counter = 10

	IF NOT Task(counter) = "" THEN

		PRINT Task(counter)

	END IF

counter = counter + 1

LOOP

PRINT

END SUB

SUB WriteTasks

'Important task COMMAND

PRINT "What is the task?"
INPUT Task(TaskNumber)
PRINT "Ok, I will take notes of the next: "; Task(TaskNumber)

TaskNumber = TaskNumber + 1

IF TaskNumber = 11 THEN

	TaskNumber = 0

END IF

END SUB

