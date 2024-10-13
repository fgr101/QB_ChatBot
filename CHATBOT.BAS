DECLARE SUB About ()
DECLARE SUB EditReminder ()
DECLARE SUB CalculateAge ()
DECLARE SUB RMDelReminder ()
DECLARE SUB RMRemindMe ()
DECLARE SUB RMShowReminders ()
DECLARE SUB RMForgetReminders ()
DECLARE SUB DelReminder ()

'AG stands for AGENDA... AG+SubName.
'Standard variables for LOOPS --> i and j.

DECLARE SUB AGDeleteContacts ()
DECLARE SUB AGDeleteContact ()
DECLARE SUB AGShowContactsInfo ()
DECLARE SUB AGShow1Contact ()
DECLARE SUB AGShowContacts ()
DECLARE SUB AGAddContact ()
DECLARE SUB AGEditContact ()

DECLARE SUB Birthday ()
DECLARE SUB DelTAG ()
DECLARE SUB TEST ()
DECLARE SUB EraseAllTags ()
DECLARE SUB AddTagNote ()
DECLARE SUB ListTags ()
DECLARE SUB ShowSpeciffic ()
DECLARE SUB ShowContactsNames ()
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
DIM SHARED j AS INTEGER

DIM SHARED counter AS INTEGER
DIM SHARED TaskNumber AS INTEGER

'Variables for reminders, tasks and notes.

DIM SHARED Reminder(20) AS STRING
DIM SHARED ReminderNumber AS INTEGER
DIM SHARED SlotNumber AS INTEGER
DIM SHARED Task(25) AS STRING
DIM SHARED again AS STRING

'CONSTANT VALUES & SWITCHS ==================================================

DIM SkipLoad AS INTEGER 'Skips LOAD when creating BRAIN.DAT for the first time
DIM SHARED AgendaStorage AS INTEGER
DIM SHARED TagStorage AS INTEGER
DIM SHARED ReminderStorage AS INTEGER

AgendaStorage = 99   '--> MAXIMUM NUMBER OF CONTACTS STORAGE.
TagStorage = 25       '--> MAXIMUM NUMBER OF TAGS.
ReminderStorage = 20  '--> MAXIMUM NUMBER OF REMINDERS.


'Personal Contacts - AGENDA =================================================

DIM SHARED AgendaID AS INTEGER
DIM SHARED AgendaName(100) AS STRING
DIM SHARED AgendaPhoneNumber(100) AS STRING
DIM SHARED AgendaEmail(100) AS STRING
DIM SHARED AgendaAddress(100) AS STRING
DIM SHARED AgendaCBU(100) AS STRING
DIM SHARED SearchName AS STRING
DIM SHARED NameFound AS SINGLE
DIM SHARED Show AS STRING
DIM SHARED EditContact AS INTEGER

EditContact = 0     'SWITCH --> Switch [ON|OFF] for EDIT CONTACT.

'TAGS and NOTES =============================================================

DIM SHARED TagNumber AS INTEGER
DIM SHARED Tagname(100) AS STRING
DIM SHARED TagNote(100, 50) AS STRING
DIM SHARED NoteCount AS INTEGER
DIM SHARED TagID(100) AS INTEGER
DIM SHARED Confirmation AS STRING

'BIRTHDAYS =================================================================

DIM SHARED NameBirth(100) AS STRING
DIM SHARED LastNameBirth(100) AS STRING
DIM SHARED MonthBirth(100) AS INTEGER
DIM SHARED DayBirth(100) AS INTEGER
DIM SHARED YearBirth(100) AS INTEGER

DIM SHARED Day AS INTEGER
DIM SHARED Month AS INTEGER
DIM SHARED Year AS INTEGER

DIM SHARED ContactAge AS INTEGER

'*** Split out the day, month and year ***

Day = VAL(MID$(DATE$, 4, 2))
Month = VAL(MID$(DATE$, 1, 2))
Year = VAL(MID$(DATE$, 7, 4))

'BOOLEANS

DIM SHARED DuplicateFound AS INTEGER
DIM SHARED BirthSwitch AS INTEGER

CLS
AgendaID = 0

'FILE SYSTEM
'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++=++++++++++++++

OPEN "brain.dat" FOR BINARY AS #1

IF LOF(1) = 0 THEN

	PRINT "Creating file brain.dat..."

	CLOSE #1
	OPEN "brain.dat" FOR OUTPUT AS #1

	counter = 0
	DO UNTIL counter = 10000

		WRITE #1, ""
		counter = counter + 1

	LOOP
	
	PRINT "brain.dat File created."
	
	SkipLoad = 1

END IF

CLOSE #1

TaskNumber = 0
ReminderNumber = 0

'=============================================================================

IF SkipLoad = 0 THEN

	Load

END IF

'=============================================================================

RandomIni 'PRODUCES VARIABLES RANDOMIZATION

RANDOMIZE TIMER

COLOR 7

CLS
PRINT "- Hi! Welcome to QB ChatBot. Type HELP to see all the commands."

IF NOT Reminder(ReminderNumber) = "" THEN

	COLOR 7
	PRINT
	PRINT "Don't forget the next >>> "

	RMShowReminders
	BEEP

END IF

IF NOT Task(TaskNumber) = "" THEN

	ShowTasks
	BEEP

END IF


BirthSwitch = 2 '============= Shows BIRTHDAYS of the DAY.
Birthday

BirthSwitch = 4 '============= Shows BIRTHDAYS of the MONTH.
Birthday



DO     'LOOP starts.
	
       COLOR 7

       again = UserInput 'Variable that remembers the last command.

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

COLOR 7

'=============================================================================

		SELECT CASE UCASE$(UserInput)

		       'BIRTHDAY REMINDERS ==========================
			
			CASE "ADD BIRTHDAY", "BIRTHDAY ADD", "NEW BIRTHDAY"

				BirthSwitch = 0
				Birthday

			CASE "SHOW BIRTHDAYS", "SHOW ALL BIRTHDAYS", "BIRTHDAYS"

				BirthSwitch = 1
				Birthday
			
			CASE "TODAYS BIRTHDAYS", "BIRTHDAYS TODAY"

				BirthSwitch = 2
				Birthday

			CASE "THIS MONTH BIRTHDAYS", "MONTH BIRTHDAYS", "BIRTHDAYS BY MONTH"

				BirthSwitch = 4
				Birthday

			CASE "DEL BIRTHDAYS", "DELETE BIRTHDAYS"

				BirthSwitch = 5
				Birthday

			CASE "BIRTHDAY"

				BirthSwitch = 3
				Birthday
			
		       'CONTACTS ====================================

			 CASE "AGENDA" 'SHOWS AGENDA COMMANDS

				PRINT " Use the next commands to work with the agenda:"
    
				COLOR 10
				PRINT
				PRINT "|ADD CONTACT| --> Adds a new contact to the agenda."
				PRINT "|SHOW CONTACT| --> Displays information for a specific contact."
				PRINT "|SHOW ALL CONTACTS| --> Displays a list of all contacts and their information."
				PRINT "|NAMES| --> Displays a list with the names of the contacts."
				PRINT "|EMAILS| --> Displays list with ALL the email addresses."
				PRINT "|SHOW EMAIL| --> Displays the email address of a specific contact."
				PRINT "|NUMBERS| --> Displays list with ALL the phone numbers."
				PRINT "|SHOW NUMBER| --> Displays the phone number of a specific contact."
				PRINT "|CBUS| --> Displays list with ALL the bank transfer numbers."
				PRINT "|SHOW CBU| --> Displays the bank transfer number of a specific contact."
				PRINT "|ADDRESSES| --> Displays list with ALL the addresses."
				PRINT "|SHOW ADDRESS| --> Displays the address of a specific contact."
				PRINT "|DEL CONTACT| --> Deletes an specific contact with all its information."
				PRINT "|DEL ALL CONTACTS| --> Deletes ALL contacts in the agenda."

				PRINT
				
		       'DELETE A SPECIFFIC CONTACT
			CASE "DEL CONTACT", "DELETE CONTACT", "ELIMINATE CONTACT", "ERASE CONTACT"

				AGDeleteContact

		       'DELETE ALL CONTACTS
		       CASE "DEL ALL CONTACTS", "DELETE ALL CONTACTS", "DELETE CONTACTS", "DEL CONTACTS", "DELETE AGENDA", "RESET AGENDA", "DEL AGENDA"

				AGDeleteContacts

		       'SHOW SPECCIFIC CONTACT INFORMATION
			CASE "SHOW NUMBER", "SHOW PHONE", "SHOW PHONE NUMBER", "SEE NUMBER", "SEE PHONE NUMBER"

			      Show = "NUMBER"
			       ShowSpeciffic

			CASE "SHOW EMAIL", "SHOW EMAIL ADDRESS", "SEE EMAIL", "SEE EMAIL ADDRESS"

			      Show = "EMAIL"
			       ShowSpeciffic

			CASE "SHOW CBU", "SHOW BANK NUMBER", "SHOW BANKING CODE", "SEE CBU", "SEE BANKING CODE", "SEE BANK NUMBER"

				Show = "CBU"
				 ShowSpeciffic

			CASE "SHOW ADDRESS", "SHOW STREET ADDRESS", "SEE ADDRESS"

				Show = "ADDRESS"
				 ShowSpeciffic

		       'SHOW ALL NAMES AND ALL INFORMATION
			CASE "NAMES", "SHOW NAMES", "SEE NAMES", "SHOW ALL NAMES", "SHOW CONTACTS NAMES", "SEE NAMES"

				Show = "NAMES"
				AGShowContactsInfo

			CASE "PHONES", "PHONE NUMBERS", "SEE PHONES", "SEE NUMBERS", "SEE PHONE NUMBERS", "SHOW PHONES", "SHOW PHONE NUMBERS", "SHOW ALL NUMBERS", "NUMBERS", "SHOW ALL PHONE NUMBERS", "SHOW CONTACTS PHONE", "SHOW PHONES",  _
"SHOW NUMBERS"

				Show = "PHONES"
				AGShowContactsInfo


			CASE "CBUS", "SEE CBUS", "SEE BANKING CODES", "SHOW BANKING CODES", "SHOW BANK NUMBERS", "SHOW ALL BANK NUMBERS", "SHOW CONTACTS BANK", "SHOW CONTACTS CBU", "SHOW ALL CBUS", "SHOW CBUS", "SHOW BANKING CODES"

				Show = "CBU"
				AGShowContactsInfo

			CASE "SHOW ALL ADDRESSES", "SEE ADDRESSES", "SHOW ADDRESSES", "SHOW ADDRESSES", "ADDRESSES"

				Show = "ADDRESS"
				AGShowContactsInfo

			
			CASE "EMAILS", "SHOW ALL EMAILS", "SEE EMAILS", "SEE ALL EMAILS", "SHOW CONTACTS EMAILS", "SHOW EMAILS"

				Show = "EMAIL"
				AGShowContactsInfo

		       'ADDING CONTACTS TO THE AGENDA
			CASE "ADD CONTACT"

				AGAddContact
				Save

		       CASE "EDIT CONTACT"

			       AGEditContact
			       Save

		       'SHOW ONLY ONE CONTACT INFORMATION
			CASE "SHOW CONTACT", "SHOW A CONTACT", "SEE CONTACT"

				AGShow1Contact

		       'SHOW ALL CONTACTS INFORMATION
			CASE "SHOW AGENDA", "SEE AGENDA", "SEE CONTACTS", "ALL CONTACTS", "SHOW ALL CONTACTS", "SHOW CONTACTS", "CONTACTS", "SHOW ME THE AGENDA"
			      
				PRINT "Showing list of contacts: "
				AGShowContacts

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
				
				COLOR 9
				
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
			
			COLOR 7

			' BTC TOOLS [CONTINUE WORKING HERE] ------------------>>> !!!!!!!!!
			
			'CASE "LAST BTC BUYING PRICE", "BUYING PRICE"
			
			'input "What was the BTC price in US Dollars when you bought it for the last time?"

			CASE "AGAIN", "REPEAT" 'Repeats the last command

			 UserInput = again
			 GOTO RepeatAgain

			CASE "WHAT IS LIFE", "WHATS LIFE"
			
				PRINT "Life is experience. We came to learn. Learn by suffering and experience. I don't know if I'm alive."
			
			CASE "WHAT ARE YOU"
			
				PRINT "I'm basically a couple lines of code. I was written in C++ first in 2020 and then remade in Qbasic in 2023."
			
			CASE "WHERE DO YOU LIVE"
			
				PRINT "I used to live in the 'cerrado brasileiro', but now I live in your computer's"
				PRINT "drive or somewhere on the internet I guess."

			'REMINDERS ===================================
			
			CASE "SET REMINDER", "ADD REMINDER", "REMINDER", "REMIND ME OF SOMETHING", "REMIND ME", "REMEMBER", "REMEMBER SOMETHING", "NEW REMINDER"

				RMRemindMe
				Save

			CASE "SHOW REMINDERS", "SHO REMINDERS", "SEE REMINDERS", "SHOW ME THE REMINDERS", "SHOW REMINDERS", "SHOW ME REMINDERS"

				RMShowReminders
				
			CASE "EDIT REMINDER", "EDIT REMINDERS"

				EditReminder
				Save

			CASE "REMINDERS"

				PRINT " Use the next commands to work with reminders:"

				COLOR 10
				PRINT
				
				PRINT "|REMIND ME| --> Adds a reminder. Reminds you of something important."
				PRINT "|SHOW REMINDERS| --> Shows ALL the reminders stored in memory."
				PRINT "|DEL REMINDER| --> Deletes an specific reminder stored in memory."
				PRINT "|FORGET REMINDERS| --> Deletes ALL the reminders stored in memory."

				PRINT
				
			CASE "FORGET REMINDERS", "DELETE ALL REMINDERS", "DELETE REMINDERS", "DEL REMINDERS"

				RMForgetReminders
				Save

			CASE "DEL REMINDER", "DELETE REMINDER"

				RMDelReminder
				
			CASE "TASK", "NEW TASK", "REMIND ME OF AN IMPORTAN TASK", "IMPORTANT TASK"
			
				WriteTasks
				Save

			CASE "WHAT DO YOU HAVE FOR ME", "REPORT", "SHOW ALL", "SHOW EVERYTHING"
			
				IF Reminder(0) = "" AND Reminder(1) = "" AND Reminder(2) = "" AND Reminder(5) = "" AND Reminder(7) = "" THEN

					PRINT "I don't have any reminders for you."

				ELSE

					COLOR 7
					PRINT
					PRINT "Don't forget the next >>> "

					RMShowReminders

				END IF

				IF Task(0) = "" AND Task(1) = "" AND Task(2) = "" AND Task(3) = "" AND Task(5) = "" AND Task(7) = "" THEN

					PRINT "I don't have any tasks for you."

				ELSE
				
				ShowTasks

				END IF

			CASE "FORGET TASKS", "FORGET TASK"
			
				ForgetTasks
				PRINT "Right! I forgot the tasks."
				
			CASE "FORGET ALL", "FORGET", "FORGET EVERYTHING", "DELETE ALL"
				
				RMForgetReminders
				ForgetTasks
				
				PRINT "Great! There's nothing to remind you of and no tasks for you to complete."

			CASE "F1", "COMMANDS", "WHAT CAN YOU DO FOR ME", "WHAT CAN YOU DO", "WHAT ARE THE COMMANDS", "SHOW ME THE HELP", "SHOW HELP", "PLEASE TELL ME THE COMMANDS", "HELP", "HELP ME", "CAN YOU HELP ME", "TELL ME THE COMMANDS PLEASE"

			       Help

			CASE ""
			
			CASE "#", "#TAG", "TAG", "TAG NOTE", "NOTE", "NOTES"
			
				TagNoteSub
			
			CASE "#LIST", "#TAG LIST", "LIST OF TAGS", "TAGS LIST", "SHOW TAGS", "TAGS", "SHOW NOTES TAGS"

			ListTags

			CASE "#ADD", "#TAG ADD", "ADD TAGGED NOTE", "ADD NOTE"

				AddTagNote

			CASE "#DEL", "#TAG DEL ALL", "ERASE TAGS", "DELETE TAGS", "ERASE ALL TAGS", "DELETE ALL TAGS", "ERASE ALL NOTHES", "DELETE ALL NOTES", "DELETE NOTES", "ERASE NOTES"

				EraseAllTags

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

			CASE "TEST"

				TEST

			CASE "ABOUT"

				About
			
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

SUB About

	COLOR 10
	PRINT
	PRINT
	PRINT "ArtInt QB ChatBot - V.0.4 [2020 - 2024]"
	PRINT "---------------------------------------"
	PRINT "This is an Open Source and Free Software."
	PRINT "Made in Qbasic by Fernando Gaston Ramirez."
	PRINT "Main concept idea and early version written in C++ in 2020."
	PRINT "First Qbasic Version, created and rewritten in March 2023."
	PRINT "Compiled for Win64 using the FreeBasic compiler."
	PRINT "Last Update released in March 2023."
	PRINT
	PRINT "Memory and storage limits: "
	PRINT
	PRINT "* Reminders -->"; (ReminderStorage - 1)
	PRINT
	PRINT "======================================"
	PRINT
	PRINT "Contributors: "
	PRINT
	PRINT "Ahmad from Syria (Ahmad-511 on GitHub)"
	PRINT
	PRINT "======================================"
	PRINT
	PRINT "Thank you so much!"
	PRINT

END SUB

SUB AddTagNote 'ADD TAGGED NOTES

COLOR 7

PRINT "Add a NEW TAG or choose a speciffic TAG from the list where the note will be written."

ListTags

AddInit:

COLOR 7

LINE INPUT "* #", UserInput

GoUpperCase

PRINT "- What is the note to be associated to this tag?"
		
FOR i = 0 TO TagStorage  'CHECKS IF THERE IS A DUPLICATE TAG.

	IF Tagname(i) = UserInput THEN

		PRINT "DUPLICATE FOUND" 'Duplicate Found!
		DuplicateFound = 1
		TagNumber = i

	END IF

NEXT i

PRINT "i  = "; i;

IF DuplicateFound = 1 THEN
	
	LINE INPUT "* "; UserInput

	IF UserInput = "" THEN   'If the note is empty it skips adding it.

		PRINT "- The note is empty. Nothing was added."
		GOTO AddTagEND

	END IF

	'NoteCount = 0

	'DO UNTIL TagNote(TagNumber, NoteCount) = ""
	'       NoteCount = NoteCount + 1
	'LOOP

	FOR i = 1 TO 25
	
		IF TagNote(TagNumber, i) = "" THEN
		
			DuplicateFound = 0
			TagNote(TagNumber, i) = UserInput
			NoteCount = i
			
			EXIT FOR
		
		END IF
	
	NEXT i
	
	'TagNote(TagNumber, NoteCount) = UserInput
	'DuplicateFound = 0

	PRINT "i  = "; i;

ELSE

	TagNumber = 0
	
	DO UNTIL Tagname(TagNumber) = ""

		TagNumber = TagNumber + 1

	LOOP


	Tagname(TagNumber) = UserInput
	LINE INPUT "* "; UserInput

	IF UserInput = "" THEN   'If the note is empty it skips adding it.

		PRINT "- The note is empty. Nothing was added."
		GOTO AddTagEND

	END IF

	TagNote(TagNumber, NoteCount) = UserInput
	
END IF

AddTagEND:
END SUB

SUB AGAddContact

'ADDS CONTACT AND THEN SORTS THEM ALPHABETICALLY.

	'IF EDIT CONTACT IS ON THEN...

	IF EditContact = 1 THEN

		FOR i = 0 TO AgendaStorage 'Looks for the nearest available empty slot

			IF AgendaName(i) = UserInput THEN

				AgendaID = i
				PRINT "AgendaID ="; AgendaID
				EXIT FOR

			END IF

		NEXT i

	'ELSE - IF EDIT CONTACT IS OFF THEN...

	ELSE

		FOR i = 0 TO AgendaStorage 'Looks for the nearest available empty slot

			IF AgendaName(i) = "" THEN

				AgendaID = i
				PRINT "AgendaID ="; AgendaID
				EXIT FOR

			END IF

		NEXT i
	
	END IF

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
	COLOR 9
	PRINT "- His/her name is "; AgendaName(AgendaID); ". Phone number "; AgendaPhoneNumber(AgendaID); ".",
	PRINT AgendaName(AgendaID); "'s email is "; AgendaEmail(AgendaID); ", address "; AgendaAddress(AgendaID); ".",
	PRINT "Bank Transference Number (CBU): "; AgendaCBU(AgendaID)
	PRINT

	AgendaID = AgendaID + 1

	TEST

'============================================================================
'SORT CONTACTS ALPHABETICALLY --> A-Z


	DIM NamesAZ(AgendaStorage) AS STRING
	DIM TempName AS STRING

	'Copy the names to a temporary array

	FOR i = 0 TO AgendaStorage

			NamesAZ(i) = AgendaName(i)

	NEXT i

	'Sorting the array alphabetically

	FOR i = 0 TO AgendaStorage

		FOR j = i TO AgendaStorage

			IF UCASE$(NamesAZ(i)) > UCASE$(NamesAZ(j)) THEN

				' Swap names

				TempName = NamesAZ(i)
				NamesAZ(i) = NamesAZ(j)
				NamesAZ(j) = TempName

				' Swap other details
				SWAP AgendaName(i), AgendaName(j)
				SWAP AgendaEmail(i), AgendaEmail(j)
				SWAP AgendaCBU(i), AgendaCBU(j)
				SWAP AgendaAddress(i), AgendaAddress(j)
				SWAP AgendaPhoneNumber(i), AgendaPhoneNumber(j)

			END IF

		NEXT j

	NEXT i

END SUB

SUB AGDeleteContact

PRINT "Name?"
LINE INPUT "* "; UserInput

NameFound = 0

FOR i = 1 TO 100   'DELETE NAME, PHONE NUMBER, EMAIL, ETC. OF AN
		   'SPECIFIC CONTACT.

	IF UserInput = AgendaName(i) THEN
					  
		NameFound = 1

		PRINT "- Are you sure you want to delete "; AgendaName(i); " from the agenda?"
		PRINT "Write YES if you do, to confirm the action."
		LINE INPUT "* "; UserInput

		GoUpperCase

		SELECT CASE UserInput

			CASE "YES"

				PRINT "- "; AgendaName(i); "'s contact information has been deleted."
		
				AgendaName(i) = ""
				AgendaPhoneNumber(i) = ""
				AgendaEmail(i) = ""
				AgendaAddress(i) = ""
				AgendaCBU(i) = ""

				EXIT FOR

			CASE ELSE

				PRINT "- The contact "; AgendaName(i); " was NOT deleted."
				EXIT FOR

		 END SELECT

	ELSE



	END IF


NEXT i

IF NameFound = 0 THEN

	PRINT "- Sadly, I wasn't able to find the contact you are looking for."
	PRINT "  Are you sure the name is correct? Try the command |NAMES| before"
	PRINT "  searching again."

	NameFound = 0

END IF

END SUB

SUB AGDeleteContacts

'DELETES ALL CONTACTS IN THE AGENDA.

PRINT "Are you sure you want to delete ALL contacts?"
PRINT "Write YES if you do, to confirm the action."
INPUT "* "; UserInput

GoUpperCase

SELECT CASE UserInput

	CASE "YES"

		FOR i = 0 TO 100

			AgendaName(i) = ""
			AgendaPhoneNumber(i) = ""
			AgendaEmail(i) = ""
			AgendaAddress(i) = ""
			AgendaCBU(i) = ""

		NEXT i

	PRINT "- ALL contacts were deleted."

	CASE ELSE

		PRINT "- Contacts were NOT deleted."

END SELECT
	
END SUB

SUB AGEditContact

EditContact = 1

PRINT " What contact would you like to EDIT?"
LINE INPUT "* "; UserInput

AGShow1Contact
AGAddContact

EditContact = 0

END SUB

SUB AGShow1Contact

IF EditContact = 1 THEN

	SearchName = UserInput
	GOTO EditSkipInput1

END IF

PRINT "What contact?"
LINE INPUT "* "; SearchName

EditSkipInput1:

NameFound = 0

FOR i = 0 TO AgendaStorage

	IF SearchName = AgendaName(i) THEN

		PRINT "- Right! Here it is!"

		COLOR 9

		PRINT
		PRINT "# "; AgendaName(i); " | "; AgendaPhoneNumber(i); " | "; AgendaEmail(i)
		PRINT "# "; AgendaAddress(i); " | "; AgendaCBU(i)
		PRINT

		NameFound = 1
		COLOR 7

		EXIT FOR

	END IF

NEXT i

IF NameFound = 0 THEN

	COLOR 7
	PRINT "- Sadly, I wasn't able to find the contact you are looking for."
	PRINT "  Are you sure the name is correct? Try the command |NAMES| before"
	PRINT "  searching again."

END IF

NameFound = 0

END SUB

SUB AGShowContacts

counter = 0

PRINT
COLOR 9

FOR i = 0 TO AgendaStorage

	IF NOT AgendaName(i) = "" AND NOT AgendaPhoneNumber(i) = "" THEN

		PRINT "# "; AgendaName(i); " | "; AgendaPhoneNumber(i); " | "; AgendaEmail(i)
		PRINT "# "; AgendaAddress(i); " | "; AgendaCBU(i)
		PRINT
	
		counter = counter + 1

		IF counter = 5 THEN

			WaitKey
			counter = 0

		END IF

       END IF

NEXT i

COLOR 7
END SUB

SUB AGShowContactsInfo
		 
PRINT "Showing information..."

PRINT

COLOR 9

FOR i = 0 TO AgendaStorage

	IF NOT AgendaName(i) = "" AND NOT AgendaEmail(i) = "" THEN

		IF Show = "NAMES" THEN
		PRINT "# "; AgendaName(i)
		END IF

		IF Show = "CBU" THEN
		PRINT "# "; AgendaName(i); ": "; AgendaCBU(i); ""
		END IF

		IF Show = "ADDRESS" THEN
		PRINT "# "; AgendaName(i); ": "; AgendaAddress(i); ""
		END IF

		IF Show = "EMAIL" THEN
		PRINT "# "; AgendaName(i); ": "; AgendaEmail(i); ""
		END IF

		IF Show = "PHONES" THEN
		PRINT "# "; AgendaName(i); ": "; AgendaPhoneNumber(i); ""
		END IF

		IF AgendaName(i) = "" THEN

			EXIT FOR

		END IF

	END IF

NEXT i

COLOR 7

PRINT

END SUB

SUB Birthday

SELECT CASE BirthSwitch

	CASE 0

		FOR i = 0 TO AgendaStorage

			IF NameBirth(i) = "" AND LastNameBirth(i) = "" THEN

				PRINT "What's the persons name?"
				LINE INPUT "* ", NameBirth(i)

				PRINT "- What's the persons lastname?"
				LINE INPUT "* ", LastNameBirth(i)

				PRINT "- Month of Birth IN NUMBER"
				INPUT "* ", MonthBirth(i)

				PRINT "- Day of Birth IN NUMBER"
				INPUT "* ", DayBirth(i)

				PRINT "- Year of Birth IN NUMBERS (4 digits)"
				INPUT "* ", YearBirth(i)

				EXIT FOR

			END IF

		NEXT i

		COLOR 7

'============================================================================
'SORT BIRTHDAYS ALPHABETICALLY --> A-Z


		DIM NamesAZ(AgendaStorage) AS STRING
		DIM TempName AS STRING

		'Copy the names to a temporary array

		FOR i = 0 TO AgendaStorage

				NamesAZ(i) = NameBirth(i)

		NEXT i

		'Sorting the array alphabetically

		FOR i = 0 TO AgendaStorage

			FOR j = i TO AgendaStorage

				IF UCASE$(NamesAZ(i)) > UCASE$(NamesAZ(j)) THEN

					' Swap names

					TempName = NamesAZ(i)
					NamesAZ(i) = NamesAZ(j)
					NamesAZ(j) = TempName

					' Swap other details

					SWAP NameBirth(i), NameBirth(j)
					SWAP LastNameBirth(i), LastNameBirth(j)
					SWAP MonthBirth(i), MonthBirth(j)
					SWAP DayBirth(i), DayBirth(j)
					SWAP YearBirth(i), YearBirth(j)

				END IF

			NEXT j

		NEXT i

	CASE 1

		COLOR 9

		PRINT
		PRINT

		FOR i = 0 TO AgendaStorage

			IF NOT NameBirth(i) = "" THEN

				PRINT NameBirth(i); " "; LastNameBirth(i); " | Birthday: "; MonthBirth(i); "/"; DayBirth(i)

			END IF

		NEXT i

		PRINT

	CASE 2

		'*** Split out the day, month and year ***
		
		COLOR 9

		FOR i = 0 TO AgendaStorage

			IF DayBirth(i) = Day AND MonthBirth(i) = Month THEN
				
				PRINT
				PRINT "Today is "; NameBirth(i); "'s birthday!"
				PRINT "Send your best wishes today!"
				PRINT

				BEEP

			END IF

		NEXT i

	CASE 3
		
			PRINT " Use the next commands to create and see birthday reminders:"
	    COLOR 10
	    PRINT
	    PRINT "|ADD BIRTHDAY| --> Adds new birthday to remember."
	    PRINT "|SHOW BIRTHDAYS| --> Shows all birthdays added."
	    PRINT "|TODAY'S BIRTHDAYS| --> Shows today's birthdays."
	    PRINT


	CASE 4


		PRINT "This month birthdays: "

		PRINT
		COLOR 9

		FOR i = 0 TO AgendaStorage

			IF MonthBirth(i) = Month THEN

				PRINT NameBirth(i); " "; LastNameBirth(i); " | Birthday: "; MonthBirth(i); "/"; DayBirth(i)
				CalculateAge
				PRINT "Age >> "; ContactAge

			END IF

		NEXT i

		PRINT

	 CASE 5


		FOR i = 0 TO AgendaStorage

			NameBirth(i) = ""
			LastNameBirth(i) = ""
			MonthBirth(i) = 0
			DayBirth(i) = 0
			YearBirth(i) = 0
		
		NEXT i

		PRINT "- All birthdays were deleted."

END SELECT

COLOR 7

END SUB

SUB CalculateAge
'-------------------

ContactAge = Year - YearBirth(i)

END SUB

SUB DelTAG

ListTags

PRINT "- What TAG would you like to DELETE?"
LINE INPUT "* ", UserInput

GoUpperCase

PRINT "Write YES if you want to DELETE the #"; UserInput; " TAG."
LINE INPUT "* ", Confirmation

IF Confirmation = "YES" OR Confirmation = "yes" THEN

	PRINT

	FOR i = 0 TO TagStorage  'CHECKS IF THERE IS A DUPLICATE TAG.

		IF Tagname(i) = UserInput THEN

			PRINT "TAG FOUND" 'Duplicate Found!
			Tagname(i) = ""

			TagNumber = i
		
			DO UNTIL TagNote(TagNumber, NoteCount) = ""

				TagNote(TagNumber, NoteCount) = ""
				PRINT "Note"; NoteCount; " DELETED..."
				NoteCount = NoteCount + 1

			LOOP


		END IF

	NEXT i

ELSE

	PRINT "- As you did not write YES, the speciffic #TAG HAS NOT been deleted!"

END IF

END SUB

SUB DescribeYourself

	PRINT "I'm "; height(10); ". ";
	PRINT "I have "; eyes(10); " eyes."
	PRINT "I have "; hair(10); " ";
	PRINT HairColor(10); " hair."

END SUB

SUB EditReminder

	COLOR 7
	PRINT "What reminder would you like to EDIT?"
	PRINT " Input its slot number."

	RMShowReminders

	COLOR 7
	INPUT "* "; SlotNumber


	IF SlotNumber > ReminderStorage THEN

		PRINT "- That number is too big. Try again."
		GOTO EditReminderEnd

	END IF

	IF NOT Reminder(SlotNumber) = "" THEN

		PRINT "|";
		PRINT SlotNumber; "| "; Reminder(SlotNumber)

		PRINT

		COLOR 7
		PRINT "Edit reminder: "
		LINE INPUT "*"; Reminder(SlotNumber)
		PRINT
		PRINT "Ok, I will remind you the next: "; Reminder(SlotNumber)

	ELSE

		COLOR 7
		PRINT "- The slot is empty, no reminder has been found... Try again."

	END IF


EditReminderEnd:
END SUB

SUB EraseAllTags

PRINT "Write YES if you want to delete all #TAGS AND NOTES."
LINE INPUT "* ", UserInput

GoUpperCase

IF UserInput = "YES" THEN

	FOR i = 0 TO 100

		Tagname(i) = ""

		FOR j = 0 TO 50

			TagNote(i, j) = ""

		NEXT j

	NEXT i

	PRINT "- All #TAGS and NOTES have been deleted!"
ELSE

PRINT "- #TAGS and NOTES HAVE NOT been deleted!"

END IF


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

	FOR j = 1 TO LEN(UserInput)
		
		IF MID$(UserInput, j, 1) <> "," AND MID$(UserInput, j, 1) <> ":" AND MID$(UserInput, j, 1) <> "." AND MID$(UserInput, j, 1) <> "?" AND MID$(UserInput, j, 1) <> "." AND MID$(UserInput, j, 1) <> "'" AND MID$(UserInput, j, 1) <> "!"  _
THEN
			
			newString = newString + MID$(UserInput, j, 1)
		
		END IF
	
	NEXT j
	
	UserInput = newString
	'PRINT UserInput
	
'=============================================================================

END SUB

SUB Help

PRINT "Sure!"
PRINT
PRINT "Here is a list of the commands and requests you can use with me: "

COLOR 10

PRINT
PRINT "|AGENDA| --> to see comands related to the agenda."
PRINT "|BIRTHDAY| --> to see comands related to birthdays."
PRINT "|REMINDERS| --> to see comands related to reminders."

PRINT

PRINT "WHAT TIME IS IT? - Ask for the current time."
PRINT "WHAT DATE IS IT? - Ask for the current date."
PRINT "TASK - Ask to add a task to your to-do list."
PRINT "ROLL A D6 - Roll a six-sided die and provide the result."

WaitKey

PRINT "FORGET TASK - Ask to delete a previously added task."
PRINT "FORGET EVERYTHING / FORGET ALL - Ask to delete all tasks and reminders."
PRINT "WHAT DO YOU HAVE FOR ME? - Show all tasks and reminders."
PRINT "I'M BORED / WHAT CAN I DO? - Suggest a random activity to do."

PRINT

PRINT "ABOUT - Show software version and other relevant information."
PRINT "CLEAR SCREEN / CLS - Clear the screen."
PRINT "AGAIN / REPEAT - Repeat the last command."

WaitKey

PRINT "#TAG - ADD A NOTE USING TAGGING FOR CATEGORIZATION."
PRINT "#TAG LIST - SHOW AVAILABLE TAGS."
PRINT "#TAG DEL ALL - DELETE ALL TAGS AND NOTES."
PRINT "BYE - End the conversation and close the program."
PRINT

WaitKey

COLOR 7

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

SUB ListTags

PRINT "Showing the list of available tags..."

COLOR 9

PRINT
PRINT "-----------------------------------"

FOR i = 0 TO TagStorage

	IF NOT Tagname(i) = "" THEN

		PRINT "#"; Tagname(i)

	END IF

NEXT i

PRINT "-----------------------------------"
PRINT


END SUB

SUB Load

'====================== LOAD ======================
'LOADS SAVED variables FROM the brain.dat file.

OPEN "brain.dat" FOR INPUT AS #1

'================ LOADING REMINDERS

FOR i = 0 TO (ReminderStorage - 1)

	INPUT #1, Reminder(i)
	
NEXT i

'================ LOADING TASKS

FOR i = 0 TO 20

	INPUT #1, Task(i)
	
NEXT i

'================ LOADING CONTACTS

INPUT #1, AgendaID

FOR i = 0 TO (AgendaStorage - 1)

	INPUT #1, AgendaName(i)
	INPUT #1, AgendaPhoneNumber(i)
	INPUT #1, AgendaEmail(i)
	INPUT #1, AgendaAddress(i)
	INPUT #1, AgendaCBU(i)
	
NEXT i

'================ LOADING #TAGS

INPUT #1, TagNumber

FOR i = 0 TO (TagStorage - 1)

	INPUT #1, Tagname(i)

	FOR j = 0 TO 50

		INPUT #1, TagNote(i, j)

	NEXT j
	
NEXT i

'============================ LOADING BIRTHDAYS

FOR i = 0 TO (AgendaStorage - 1)

	INPUT #1, NameBirth(i)
	INPUT #1, LastNameBirth(i)
	INPUT #1, MonthBirth(i)
	INPUT #1, DayBirth(i)
	INPUT #1, YearBirth(i)

NEXT i

CLOSE #1

PRINT
PRINT "Loading..."

END SUB

SUB Notes

' TO DO

'- CONTINUE WORKING ON [EDIT REMINDERS FEATURE]

'- TAGS --> Improve the addition of TAGS.
'- TAGS --> Solve some bugs.

'- Add BIRTHDAYS to the agenda, connect them with the BIRTHDAYS system.
'- Delete an specific BIRTHDAY
'- Delete all BIRTHDAYS.
'- Show BIRTHDAYS THIS MONTH
'- Show BIRTHDAYS THIS WEEK
'- Show persons AGE, IF birth year is available.

'- Add paragraph and information at the beginning of the code.
'- Nuevos Comandos para borrar un tag especifico.
'- The ChatBot tells you when there aren't any reminders for you.

'=====================================================================
' DONE

'V 0.4

'- New SUBFUNCTION created for the ABOUT section. Section UPDATED.
'- REMINDERS: Storage of reminders increased up to 19.
'- SAVING improved. The program saves after you add or modifies reminders,
'  tasks, birthdays, etc.
'- REMINDERS: You can ADD a reminder.
'- REMINDERS: You can delete all the reminders using FORGET REMINDERS.
'- REMINDERS: You can DELETE an specific reminder.
'- REMINDERS: New reminders always added in the nearest empty slot available.
'- REMINDERS: SLOT NUMBERS shown along when using |SHOW REMINDERS|.
'- REMINDERS: New CONSTANT called ReminderStorage (MAX NUMBER OF REMINDERS).
'- REMINDERS: Use |REMINDERS| to show a list with the different keywords
'  and commands available to deal with reminders.

'- Show BIRTHDAYS in the right alphabetical order. SORT A-Z.

'V 0.3

'- MODIFY AN SPECIFIC CONTACT
'- Be able to edit information of an specific contact.
'- Show AGENDA in the right alphabetical order. SORT A-Z.
'- Show message when writing an unexisting contact name:
'  "The contact isn't part of the agenda" or something similar...
'- Improve SAVING and LOADING with "FOR i... NEXT" i instead of "DO...LOOP".
'- DELETE ALL CONTACTS
'- DELETE A SPECIFIC CONTACT
'- SHOW A SPECIFFIC CONTACT CBU
'- SHOW A SPECIFFIC CONTACT PHONE NUMBER
'- SHOW A SPECIFFIC CONTACT EMAIL
'- SHOW A SPECIFFIC CONTACT ADDRESS
'- SOLVE BUG WHEN DELETING CONTACTS & SHOWING THEM
'- AGENDA: New contacts always added in the nearest empty slot available.
'- AGENDA commands added. General functinality and visuals improved.
'- Color added to the text, visual enhanced.
'- Now you can add a contact's birthday, and the Chatbot will store it in its memory.
'  Upon startup, it will check for upcoming birthdays and notify you.
'  This feature draws inspiration from Facebook's birthday notifications.
'- Resolved bugs related to birthday reminders.
'- Implemented Birthday Reminders.
'- DELETE a specific TAG.
'- TAGGED NOTES: Added validation for tagged notes.
'- Duplicate Entries: When adding tags or notes, ensure to check if the entry already exists
'  to avoid duplicates.
'- When a tag is found, a new note will now be associated with the existing tag.
'- Capability to delete all tags.
'- Introduced commands to SHOW NOTES.
'- Check for the existence of a tag before adding it.
'- Bug: REDO FROM START when writing commas SOLVED! Thanks to AHMAD-511.
'  Solved throughout the program using LINE INPUT instead of INPUT.
'- AGENDA: CONTACTS
'- ADD CONTACTS [ADD CONTACT] --> Can now store up to 100 contacts.
'- YOU CAN ADD BANK INFORMATION - CBU TO THE CONTACTS
'- SHOW ALL CONTACTS [SHOW CONTACTS]
'- SHOW A SPECIFIC CONTACT
'- SHOW LIST OF EMAILS --> NAME: EMAILS
'- SHOW LIST OF PHONE NUMBERS --> NAME: NUMBER
'- SHOW LIST OF ADDRESSES --> NAME: ADDRESS

'V 0.2

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

'V 0.1

'- First basic structure and algorithm of the program. Base code, basic
'  structure planned and created in C++ then in QBASIC.

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

SUB RMDelReminder
'Deletes an specific reminder. Uses the slot number for that.

	PRINT " Slot number?"
	INPUT "* ", SlotNumber

	IF SlotNumber > ReminderStorage THEN

		PRINT "- Slot number is OUT OF RANGE! Imposible to access something that doesn't"
		PRINT "  exist! Try again using a reasonable value."

	       GOTO EndSubRMDelReminder

	END IF


	IF NOT Reminder(SlotNumber) = "" THEN

		Reminder(SlotNumber) = ""
		PRINT "- Reminder at slot"; SlotNumber; "has been deleted!"

	ELSE

		PRINT "- The slot was already empty!"

	END IF

EndSubRMDelReminder:
END SUB

SUB RMForgetReminders

PRINT "Are you sure you want to delete ALL the reminders?"
PRINT "Write YES if you do in order to confirm the action."
INPUT "* ", UserInput

GoUpperCase

SELECT CASE UserInput

	CASE "YES"

		counter = 0


		FOR i = 0 TO ReminderStorage
		
			Reminder(i) = ""
			
		NEXT i

	PRINT "- Right! I forgot all the reminders."

	CASE ELSE

		PRINT "- Reminders were NOT deleted."

END SELECT

END SUB

SUB RMRemindMe
'Remind me command

	FOR i = 0 TO ReminderStorage 'Looks for the nearest available empty slot

		IF i = ReminderStorage THEN

			PRINT " There are no empty slots to store more reminders. Please, try to"
			PRINT "  delete some older reminders in order to continue adding new ones."

			GOTO EndSubRemindMe
			
		END IF


		IF Reminder(i) = "" THEN

			EXIT FOR

		END IF

	NEXT i

	PRINT "What should I remind you of?"
	LINE INPUT Reminder(i)

	PRINT "Ok, I will remind you the next: "; Reminder(i)

EndSubRemindMe:
END SUB

SUB RMShowReminders

DIM NoReminders AS INTEGER

NoReminders = 0

FOR i = 0 TO ReminderStorage

	IF NOT Reminder(i) = "" THEN

	  NoReminders = 1  'means there are reminders available.

	END IF

NEXT i


counter = 0

IF NoReminders = 1 THEN  'If there are reminders stored in memory...
	
	PRINT

	COLOR 9
	DO UNTIL counter = ReminderStorage

		IF NOT Reminder(counter) = "" THEN

			PRINT "|";
			PRINT counter; "| "; Reminder(counter)

		END IF

	counter = counter + 1

	LOOP
	PRINT

ELSE

	PRINT " There are NO REMINDERS stored in memory. Add the first reminder to start."
	PRINT "Use the command |REMIND ME| to add your first reminder."
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

' ======================== SAVING REMINDERS

FOR i = 0 TO ReminderStorage

	WRITE #1, Reminder(i)
	
NEXT i

' ======================== SAVING TASKS

FOR i = 0 TO 10

	WRITE #1, Task(i)
	
NEXT i

' ======================== SAVING CONTACTS

WRITE #1, AgendaID

FOR i = 0 TO AgendaStorage

	WRITE #1, AgendaName(i)
	WRITE #1, AgendaPhoneNumber(i)
	WRITE #1, AgendaEmail(i)
	WRITE #1, AgendaAddress(i)
	WRITE #1, AgendaCBU(i)
	
NEXT i

' ======================== SAVING #TAGS

WRITE #1, TagNumber

FOR i = 0 TO TagStorage

	WRITE #1, Tagname(i)

	FOR j = 0 TO 50

		WRITE #1, TagNote(i, j)

	NEXT j
	
NEXT i

'===================================== SAVING BIRTHDAYS

FOR i = 0 TO (AgendaStorage + 1)

	WRITE #1, NameBirth(i)
	WRITE #1, LastNameBirth(i)
	WRITE #1, MonthBirth(i)
	WRITE #1, DayBirth(i)
	WRITE #1, YearBirth(i)

NEXT i

CLOSE #1

PRINT
PRINT "Saving..."

END SUB

SUB ShowSpeciffic
'SHOWS AN SPECIFIC CONTACT INFORMATION.

PRINT "What contact?"
LINE INPUT "* "; SearchName

NameFound = 0
COLOR 9

FOR i = 0 TO AgendaStorage

	IF AgendaName(i) = SearchName THEN

		PRINT
		PRINT "# "; AgendaName(i); " | ";

		SELECT CASE Show

			CASE "NUMBER"
	
				PRINT "Phone Number: "; AgendaPhoneNumber(i); ""
				
			CASE "CBU"

				PRINT "Banking Code: "; AgendaCBU(i); ""
				
			CASE "EMAIL"

				PRINT "Email Address: "; AgendaEmail(i); ""
				
			CASE "ADDRESS"

				PRINT "Street Address: "; AgendaAddress(i); ""
				
		END SELECT

		PRINT
		NameFound = 1
		EXIT FOR

	END IF
	
NEXT i

IF NameFound = 0 THEN

	COLOR 7
	PRINT "- Sadly, I wasn't able to find the contact you are looking for."
	PRINT "  Are you sure the name is correct? Try the command |NAMES| before"
	PRINT "  searching again."

END IF

END SUB

SUB ShowTasks

counter = 0

COLOR 7
PRINT
PRINT "Remember you have some important tasks to do >>> "
PRINT

COLOR 9
DO UNTIL counter = 10

	IF NOT Task(counter) = "" THEN

		PRINT "-> ";
		PRINT counter; "| "; Task(counter)

	END IF

counter = counter + 1

LOOP

PRINT

END SUB

SUB TagNoteSub '!!!!!! CONTINUE WORKING HERE!!!!!!

PRINT "LIST, SHOW, ADD or DEL a speciffic tagged note?"
LINE INPUT "* ", UserInput

GoUpperCase

SELECT CASE UserInput
	
	CASE "DEL"

		DelTAG

	CASE "LIST", "LIST TAGS"

		ListTags

	CASE "ADD", "ADD NOTE"

		AddTagNote
	
	CASE "SHOW", "SHOW NOTES", "SHOW NOTE"
	
		ListTags

		COLOR 7

		PRINT "- Which speciffic TAG do you want to check?"
		LINE INPUT "* #", UserInput
	
		GoUpperCase
		COLOR 9

		PRINT
		PRINT "-----------------------------------"
	
		counter = 0
	
		DO UNTIL counter = TagStorage
	
			IF Tagname(counter) = UserInput THEN
		
				FOR i = 0 TO 50

					PRINT TagNote(counter, i)
									     
					IF TagNote(counter, i) = "" THEN
					
						EXIT FOR

					END IF

				NEXT i
			END IF
		
			counter = counter + 1

		LOOP

		PRINT "-----------------------------------"
		PRINT

END SELECT

END SUB

SUB TEST

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

