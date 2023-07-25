DECLARE SUB ShowSpeciffic ()
DECLARE SUB ShowContactsInfo ()
DECLARE SUB ShowContactsNames ()
DECLARE SUB Show1Contact ()
DECLARE SUB ShowContacts ()
DECLARE SUB AddContact ()
DECLARE SUB PersonalContacts ()
DECLARE SUB WaitKey ()
DECLARE SUB Help ()
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

DECLARE SUB TagNoteSub ()
DECLARE SUB GoUpperCase ()

DIM SHARED UserInput AS STRING

'Variables for RANDOMIZARION (most of them ARRAYS)

DIM SHARED D3 AS INTEGER
DIM SHARED D6 AS INTEGER
DIM SHARED D10 AS INTEGER

DIM SHARED height(10) AS STRING
DIM SHARED eyes(10) AS STRING
DIM SHARED hair(10) AS STRING
DIM SHARED HairColor(10) AS STRING

DIM SHARED newString AS STRING
DIM SHARED i AS INTEGER

DIM SHARED counter AS INTEGER
DIM SHARED TaskNumber AS INTEGER
DIM SHARED ReminderNumber AS INTEGER

' Variables for reminders, tasks and notes.

DIM SHARED Reminder(10) AS STRING
DIM SHARED Task(10) AS STRING
DIM SHARED Again AS STRING

' Personal Contacts

DIM SHARED AgendaID AS INTEGER
DIM SHARED AgendaName(100) AS STRING
DIM SHARED AgendaPhoneNumber(100) AS STRING
DIM SHARED AgendaEmail(100) AS STRING
DIM SHARED AgendaAddress(100) AS STRING
DIM SHARED AgendaCBU(100) AS STRING
DIM SHARED SearchName AS STRING
DIM SHARED NameFound AS SINGLE
DIM SHARED Show AS STRING

DIM SHARED TagNumber AS INTEGER
DIM SHARED TagName(500) AS STRING
DIM SHARED TagNote(500) AS STRING
DIM SHARED TagID(500) AS INTEGER

AgendaID = 0

'FILE SYSTEM
'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++=++++++++++++++

OPEN "brain.dat" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "brain.dat" FOR OUTPUT AS #1

counter = 0
DO UNTIL counter = 10000

	WRITE #1, ""
	counter = counter + 1

LOOP

'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""
'WRITE #1, ""

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

IF NOT Reminder(ReminderNumber) = "" THEN

	ShowReminders
	BEEP

END IF

IF NOT Task(TaskNumber) = "" THEN

	ShowTasks
	BEEP

END IF

DO     'LOOP starts.
	
       Again = UserInput 'Variable that remembers the last command.

       LINE INPUT "* ", UserInput
       PRINT "- ";

'=============================================================================

	'Changes UserInput to UPPER CASE
	
	GoUpperCase
	
	'UserInput = UCASE$(UserInput)
	
	'The next piece of code was suggested by the AI. It aims to
	'eliminate any special characters like !?,.' etc. from the users
	'answer and then store it in the variable UserInput.

	'newString = ""

	'FOR i = 1 TO LEN(UserInput)
		
	'       IF MID$(UserInput, i, 1) <> "," AND MID$(UserInput, i, 1) <> ":" AND MID$(UserInput, i, 1) <> "." AND MID$(UserInput, i, 1) <> "?" AND MID$(UserInput, i, 1) <> "." AND MID$(UserInput, i, 1) <> "'" AND MID$(UserInput, i, 1) <> "!"  _
'THEN
			
	'               newString = newString + MID$(UserInput, i, 1)
		
	'       END IF
	
	'NEXT i
	
	'UserInput = newString
	'PRINT UserInput
	
RepeatAgain:

'=============================================================================

		SELECT CASE UCASE$(UserInput)

		       ' CONTACTS ====================================

		       'SHOW SPECCIFIC CONTACT INFORMATION
			CASE "SHOW NUMBER", "SHOW PHONE", "SHOW PHONE NUMBER"

			      Show = "NUMBER"
			       ShowSpeciffic

			CASE "SHOW EMAIL", "SHOW EMAIL ADDRESS"

			      Show = "EMAIL"
			       ShowSpeciffic

			CASE "SHOW CBU", "SHOW BANK NUMBER", "SHOW BANKING CODE"

				Show = "CBU"
				 ShowSpeciffic

			CASE "SHOW ADDRESS", "SHOW STREET ADDRESS"

				Show = "ADDRESS"
				 ShowSpeciffic

		       'SHOW ALL NAMES AND ALL INFORMATION
			CASE "SHOW ALL NAMES", "SHOW CONTACTS NAMES"

				Show = "NAMES"
				ShowContactsInfo

			CASE "SHOW PHONES", "SHOW PHONE NUMBERS", "SHOW ALL PHONE NUMBERS", "SHOW CONTACTS PHONE", "SHOW PHONES", "SHOW NUMBERS"

				Show = "PHONES"
				ShowContactsInfo


			CASE "SHOW BANKING CODES", "SHOW BANK NUMBERS", "SHOW ALL BANK NUMBERS", "SHOW CONTACTS BANK", "SHOW CONTACTS CBU", "SHOW ALL CBUS", "SHOW CBUS", "SHOW BANKING CODES"

				Show = "CBU"
				ShowContactsInfo

			CASE "SHOW ALL ADDRESSES", "SHOW ADDRESSES", "SHOW ADDRESSES", "ADDRESSES"

				Show = "ADDRESS"
				ShowContactsInfo

			
			CASE "SHOW ALL EMAILS", "SHOW CONTACTS EMAILS", "SHOW EMAILS"

				Show = "EMAIL"
				ShowContactsInfo

		       'ADDING CONTACTS TO THE AGENDA
			CASE "ADD CONTACT"

				AddContact

		       'SHOW ONLY ONE CONTACT INFORMATION
			CASE "SHOW CONTACT", "SHOW A CONTACT"

				Show1Contact

		       'SHOW ALL CONTACTS INFORMATION
			CASE "SHOW ALL CONTACTS", "SHOW CONTACTS"
			      
				PRINT "Showing list of contacts: "
				ShowContacts

			CASE "HELLO", "HI", "HEY", "HI QB", "WHATS UP" ' OTHERS ====================================

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
				
			CASE "ROLL A DIE", "ROLL A D6", "ROLL D6", "ROLL A D6 PLEASE", "D6", "PLEASE ROLL A D6", "CAN YOU ROLL A D6 PLEASE", "CAN YOU ROLL A D6", "GIVE ME A D6"
			
				RNumber6
				PRINT "Sure I can do that! ... The D6 DIE shows a "; D6

				PRINT

				SELECT CASE D6

					 CASE 1

						PRINT "+=======+"
						PRINT "|       |"
						PRINT "|   *   |"
						PRINT "|       |"
						PRINT "+=======+"

					 CASE 2

						PRINT "+=======+"
						PRINT "|       |"
						PRINT "|  * *  |"
						PRINT "|       |"
						PRINT "+=======+"


					 CASE 3

						PRINT "+=======+"
						PRINT "|  *    |"
						PRINT "|   *   |"
						PRINT "|    *  |"
						PRINT "+=======+"

					 CASE 4

						PRINT "+=======+"
						PRINT "|  * *  |"
						PRINT "|       |"
						PRINT "|  * *  |"
						PRINT "+=======+"
					 
					 CASE 5
				 
						PRINT "+=======+"
						PRINT "|  * *  |"
						PRINT "|   *   |"
						PRINT "|  * *  |"
						PRINT "+=======+"

					 CASE 6

						PRINT "+=======+"
						PRINT "|  * *  |"
						PRINT "|  * *  |"
						PRINT "|  * *  |"
						PRINT "+=======+"
					 
				END SELECT
			     
			PRINT

			' BTC TOOLS [CONTINUE WORKING HERE] ------------------>>> !!!!!!!!!
			
			'CASE "LAST BTC BUYING PRICE", "BUYING PRICE"
			
			'input "What was the BTC price in US Dollars when you bought it for the last time?"

			CASE "AGAIN", "REPEAT" 'Repeats the last command

			 UserInput = Again
			 GOTO RepeatAgain

			CASE "WHAT IS LIFE", "WHATS LIFE"
			
				PRINT "Life is experience. We came to learn. Learn by suffering and experience. I don't know if I'm alive."
			
			CASE "WHAT ARE YOU"
			
				PRINT "I'm basically a couple lines of code. I was written in C++ first in 2020 and then remade in Qbasic in 2023."
			
			CASE "WHERE DO YOU LIVE"
			
				PRINT "I used to live in the 'cerrado brasileiro', but now I live in your computer's"
				PRINT "drive or somewhere on the internet I guess."

			CASE "REMIND ME OF SOMETHING", "REMIND ME", "REMEMBER", "REMEMBER SOMETHING", "NEW REMINDER"

				RemindMe

			
			CASE "TASK", "NEW TASK", "REMIND ME OF AN IMPORTAN TASK", "IMPORTANT TASK"
			
				WriteTasks
				

			CASE "WHAT DO YOU HAVE FOR ME"
			

				IF Reminder(0) = "" AND Reminder(1) = "" AND Reminder(2) = "" AND Reminder(5) = "" AND Reminder(7) = "" THEN

					PRINT "I don't have any reminders for you."

				ELSE

				ShowReminders

				END IF

				IF Task(0) = "" AND Task(1) = "" AND Task(2) = "" AND Task(3) = "" AND Task(5) = "" AND Task(7) = "" THEN

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
			
			CASE "FORGET ALL", "FORGET", "FORGET EVERYTHING", "DELETE ALL"
				
				ForgetReminders
				ForgetTasks
				
				PRINT "Great! There's nothing to remind you of and no tasks for you to complete."

			CASE "F1", "COMMANDS", "WHAT CAN YOU DO FOR ME", "WHAT CAN YOU DO", "WHAT ARE THE COMMANDS", "SHOW ME THE HELP", "SHOW HELP", "PLEASE TELL ME THE COMMANDS", "HELP", "HELP ME", "CAN YOU HELP ME", "TELL ME THE COMMANDS PLEASE"

			       Help

			CASE ""
			
			CASE "#TAG", "TAG", "TAG NOTE", "NOTE"
			
				TagNoteSub
			
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
				
			CASE "CLS", "CLEAR SCREEN", "CLEAR THE SCREEN", "CLEAR"

				CLS

			CASE "ABOUT"

				PRINT
				PRINT
				PRINT "ArtInt QB ChatBot - V.0.2 [2020 - 2023]"
				PRINT "---------------------------------------"
				PRINT "This is an Open Source and Free Software."
				PRINT "Made in Qbasic by Fernando Gaston Ramirez."
				PRINT "Main concept idea and early version written in C++ in 2020."
				PRINT "First Qbasic Version, created and rewritten in March 2023."
				PRINT "Compiled for Win64 using the FreeBasic compiler."
				PRINT "Last Update released in March 2023."
				PRINT
				PRINT "Contributors: "
				PRINT
				PRINT "Ahmad from Syria (Ahmad-511 on GitHub)"
				PRINT
				PRINT "Thank you so much!"

			CASE "END", "CLOSE", "BYE", "OK BYE", "EXIT"

				PRINT "Bye! I hope to see you soon!"

				Save
				END

			CASE ELSE
				
				PRINT "At the moment I can only answer to specific requests and very common questions."
				PRINT "I'm sorry, I don't understand. Can you try asking a different question?"
				PRINT "Please, avoid using any kind of punctuation when writing. I still don't know"
				PRINT "how to deal with some of them."

		END SELECT

'=============================================================================

LOOP

SUB AddContact

PRINT "Sure! If you don't have the information asked don't write anything."
PRINT "Just leave it blank. Ok? ... What is his/her full name?"
LINE INPUT "* ", AgendaName(AgendaID)
PRINT "What is "; AgendaName(AgendaID); "'s number?"
LINE INPUT "* ", AgendaPhoneNumber(AgendaID)
PRINT "What is "; AgendaName(AgendaID); "'s email address?"
LINE INPUT "* ", AgendaEmail(AgendaID)
PRINT "What is "; AgendaName(AgendaID); "'s address?"
LINE INPUT "* ", AgendaAddress(AgendaID)
PRINT "What is "; AgendaName(AgendaID); "'s Bank Transfer Number (CBU)?"
LINE INPUT "* ", AgendaCBU(AgendaID)


PRINT
PRINT "- His/her name is "; AgendaName(AgendaID); ". Phone number "; AgendaPhoneNumber(AgendaID); "."
PRINT AgendaName(AgendaID); "'s email is "; AgendaEmail(AgendaID); "."; AgendaAddress(AgendaID); "."
PRINT "Bank Transference Number (CBU): "; AgendaCBU(AgendaID)



AgendaID = AgendaID + 1

END SUB

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

SUB GoUpperCase

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

END SUB

SUB Help

PRINT "Sure!"
PRINT
PRINT "Here is a list of the commands and requests you can use with me: "
PRINT
PRINT "WHAT TIME IS IT? - Ask for the current time."
PRINT "WHAT DATE IS IT? - Ask for the current date."
PRINT "REMIND ME - Ask to set a reminder."
PRINT "TASK - Ask to add a task to your to-do list."
PRINT "ROLL A D6 - Roll a six-sided die and provide the result."
PRINT "FORGET REMINDER - Ask to delete a previously set reminder."
PRINT "FORGET TASK - Ask to delete a previously added task."
PRINT "FORGET EVERYTHING / FORGET ALL - Ask to delete all tasks and reminders."
PRINT "WHAT DO YOU HAVE FOR ME? - Show all tasks and reminders."
PRINT "I'M BORED / WHAT CAN I DO? - Suggest a random activity to do."
PRINT "ABOUT - Show software version and other relevant information."
PRINT "CLEAR SCREEN / CLS - Clear the screen."
PRINT "AGAIN / REPEAT - Repeat the last command."
PRINT "ADD CONTACT"
PRINT "SHOW CONTACT"
PRINT "SHOW ALL CONTACTS"
PRINT "SHOW EMAIL/ SHOW NUMBER / SHOW CBU / SHOW ADDRESS"
PRINT "#TAG - ADD A NOTE USING TAGGING FOR CATEGORIZATION."
PRINT "BYE - End the conversation and close the program."
PRINT

WaitKey

PRINT "USAGE:"
PRINT
PRINT "To use any of the commands, simply type the command in the chatbot program"
PRINT "and hit ENTER. The program will respond with the appropriate information"
PRINT "or action."

PRINT
PRINT "Note: Make sure to spell the commands correctly and use proper punctuation."
PRINT "The chatbot program may not understand incorrectly spelled words or commands."
PRINT

PRINT "- That is all. "

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

counter = 0  '================ LOADING CONTACTS

INPUT #1, AgendaID

DO UNTIL counter = 100

	INPUT #1, AgendaName(counter)
	INPUT #1, AgendaPhoneNumber(counter)
	INPUT #1, AgendaEmail(counter)
	INPUT #1, AgendaAddress(counter)
	INPUT #1, AgendaCBU(counter)

	counter = counter + 1

LOOP

CLOSE #1

PRINT
PRINT "Loading..."

END SUB

SUB Notes

' TO DO

' - SHOW A SPECIFFIC CONTACT CBU
' - SHOW A SPECIFFIC CONTACT PHONE NUMBER
' - SHOW A SPECIFFIC CONTACT EMAIL
' - SHOW A SPECIFFIC CONTACT ADDRESS
' - DELETE A SPECIFIC CONTACT
' - MODIFY A SPECIFFIC CONTACT
' - The ChatBot is able to remember up to 10 different reminders.
' - The ChatBot is able to forget these 10 reminders.
' - The ChatBot tells you when there aren't any reminders for you.

' DONE

'V 0.2

' - Bug: REDO FROM START when writing commas SOLVED! Thanks to AHMAD-511.
'   Solved in the whole program. LINE INPUT insted of INPUT.
' - AGENDA: CONTACTS
' - ADD CONTACTS [ADD CONTACT] 50% --> Able to store up to 100 contacts.
' - YOU CAN ADD BANK INFORMATION - CBU TO THE CONTACTS
' - SHOW ALL CONTACTS [SHOW CONTACTS] 50%
' - SHOW A SPECIFFIC CONTACT
' - SHOW LIST OF EMAILS --> NAME: EMAILS
' - SHOW LIST OF PHONE NUMBERS --> NAME: NUMBER
' - SHOW LIST OF ADDRESSES --> NAME: ADDRESS

'V 0.1

' - SOUND: Notification sound when you have a task or a reminder.
' - Help --> Located in the SUB called Help now.
' - AGAIN: Repeats the last command. Useful when rolling dice for instance.
' - ABOUT: Shows current software version and other relevant information.
' - CLEAR SCREEN: you can CLS the screen.
' - D6 graphics made with ASCII characters.
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
LINE INPUT Reminder(ReminderNumber)
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

counter = 0 ' ======================== SAVING CONTACTS

WRITE #1, AgendaID

DO UNTIL counter = 100

	WRITE #1, AgendaName(counter)
	WRITE #1, AgendaPhoneNumber(counter)
	WRITE #1, AgendaEmail(counter)
	WRITE #1, AgendaAddress(counter)
	WRITE #1, AgendaCBU(counter)

	counter = counter + 1

LOOP

CLOSE #1

PRINT
PRINT "Saving..."

END SUB

SUB Show1Contact

PRINT "What contact?"
LINE INPUT "* "; SearchName

counter = 0

DO UNTIL counter = 101

	IF SearchName = AgendaName(counter) THEN

		PRINT "- Right! Here it is!"

		PRINT
		PRINT "# "; AgendaName(counter); " | "; AgendaPhoneNumber(counter); " | "; AgendaEmail(counter)
		PRINT "# "; AgendaAddress(counter); " | "; AgendaCBU(counter)
		PRINT

		NameFound = 1

	END IF

	IF AgendaName(counter) = "" THEN

		counter = 100

		IF NameFound = 0 THEN

			PRINT "Sadly, I wasn't able to find the contact you are looking for. "
			PRINT "Are you sure the name is correct? Try with [show all contacts]."

		END IF

	END IF

	counter = counter + 1

LOOP

NameFound = 0

END SUB

SUB ShowContacts

counter = 0

PRINT

DO UNTIL counter = 101

	PRINT "# "; AgendaName(counter); " | "; AgendaPhoneNumber(counter); " | "; AgendaEmail(counter)
	PRINT "# "; AgendaAddress(counter); " | "; AgendaCBU(counter)
	PRINT

	counter = counter + 1

	IF AgendaName(counter) = "" THEN

		counter = 101

	END IF


LOOP

END SUB

SUB ShowContactsInfo

counter = 0

PRINT

DO UNTIL counter = 101

	IF Show = "NAMES" THEN
	PRINT "# "; AgendaName(counter); ""
	END IF

	IF Show = "CBU" THEN
	PRINT "# "; AgendaCBU(counter); ""
	END IF

	IF Show = "ADDRESS" THEN
	PRINT "# "; AgendaAddress(counter); ""
	END IF

	IF Show = "EMAIL" THEN
	PRINT "# "; AgendaEmail(counter); ""
	END IF

	IF Show = "PHONES" THEN
	PRINT "# "; AgendaPhoneNumber(counter); ""
	END IF


	counter = counter + 1

	IF AgendaName(counter) = "" THEN

		counter = 101

	END IF


LOOP

PRINT

END SUB

SUB ShowReminders

counter = 0

PRINT
PRINT "Don't forget the next >>> "
PRINT

DO UNTIL counter = 10


	IF NOT Reminder(counter) = "" THEN

		PRINT "-> ";
		PRINT Reminder(counter)

	END IF

counter = counter + 1

LOOP

PRINT

END SUB

SUB ShowSpeciffic

' SHOW SPECIFFIC CONTACT INFORMATION

PRINT "What contact?"
LINE INPUT "* "; SearchName

counter = 0

DO UNTIL counter = 101

	IF Show = "NUMBER" AND AgendaName(counter) = SearchName THEN

		PRINT "# Phone Number: "; AgendaPhoneNumber(counter); ""
		counter = 100

	END IF

	IF Show = "CBU" AND AgendaName(counter) = SearchName THEN

		PRINT "# Banking Code: "; AgendaCBU(counter); ""
		counter = 100

	END IF

	IF Show = "EMAIL" AND AgendaName(counter) = SearchName THEN

		PRINT "# Email Address: "; AgendaEmail(counter); ""
		counter = 100

	END IF

	IF Show = "ADDRESS" AND AgendaName(counter) = SearchName THEN

		PRINT "# Street Address: "; AgendaAddress(counter); ""
		counter = 100

	END IF

	counter = counter + 1

LOOP

END SUB

SUB ShowTasks

counter = 0

PRINT
PRINT "Remember you have some important tasks to do >>> "
PRINT

DO UNTIL counter = 10

	IF NOT Task(counter) = "" THEN

		PRINT "-> ";
		PRINT Task(counter)

	END IF

counter = counter + 1

LOOP

PRINT

END SUB

SUB TagNoteSub '!!!!!! CONTINUE WORKING HERE!!!!!!

PRINT "LIST tags, SHOW tagged notes or ADD a speciffic tagged note?"
LINE INPUT "*", UserInput

GoUpperCase

SELECT CASE UserInput
	
	CASE "LIST"

	PRINT
	PRINT "-----------------------------------"

	counter = 0

	DO UNTIL counter = 500

		IF NOT TagName(counter) = "" THEN

			PRINT "#"; TagName(counter)

		END IF

	counter = counter + 1

	LOOP

	PRINT "-----------------------------------"
	PRINT

	CASE "ADD"

		PRINT "Add the TAGNAME to choose the speciffic tag where the note will be written."
		LINE INPUT "* #", UserInput
		
		GoUpperCase
		
		TagName(TagNumber) = UserInput

		PRINT "What is the note to be associated to this tag?"
		LINE INPUT "* "; UserInput

		TagNote(TagNumber) = UserInput

		'TagID(TagNumber) = TagID(TagNumber) + 1
		
		TagNumber = TagNumber + 1

	
	CASE "SHOW"
	
	PRINT "Add the TAGNAME to choose the speciffic tags to be searched."
	LINE INPUT "* #", UserInput
	
	GoUpperCase
	
	PRINT
	PRINT "-----------------------------------"
	
	counter = 0
	
	DO UNTIL counter = 500
	
		IF TagName(counter) = UserInput THEN
		
			PRINT TagNote(counter)
		
		END IF
		
		counter = counter + 1

	LOOP

	PRINT "-----------------------------------"
	PRINT

END SELECT

END SUB

SUB WaitKey

DO WHILE INKEY$ = ""
LOOP

END SUB

SUB WriteTasks

'Important task COMMAND

PRINT "What is the task?"
LINE INPUT Task(TaskNumber)
PRINT "Ok, I will take notes of the next: "; Task(TaskNumber)

TaskNumber = TaskNumber + 1

IF TaskNumber = 11 THEN

	TaskNumber = 0

END IF

END SUB

