DIM SHARED UserInput AS STRING

CLS
PRINT "Hi! Welcome to QB ChatBot."


DO     'LOOP starts.
	
       INPUT "* ", UserInput

'=============================================================================

	'Changes UserInput to UPPER CASE
	UserInput = UCASE$(UserInput)
	
	'The next piece of code was suggested by the AI. It aims to
	'eliminate any special characters like !?,.' etc. from the users
	'answer and then store it in the variable UserInput.

	DIM newString AS STRING
	newString = ""

	FOR i = 1 TO LEN(UserInput)
		
		IF MID$(UserInput, i, 1) <> "," AND MID$(UserInput, i, 1) <> ":" AND MID$(UserInput, i, 1) <> "." AND MID$(UserInput, i, 1) <> "?" AND MID$(UserInput, i, 1) <> "." AND MID$(UserInput, i, 1) <> "'" AND MID$(UserInput, i, 1) <> "!"  _
THEN
			
			newString = newString + MID$(UserInput, i, 1)
		
		END IF
	
	NEXT i
	
	UserInput = newString
	PRINT UserInput
	
'=============================================================================

		SELECT CASE UCASE$(UserInput)

			CASE "HELLO", "HI", "HEY", "HI QB", "WHATS UP"
				
				PRINT "Hi there!"
			
			CASE "HI HOW ARE YOU", "HOW ARE YOU", "HOWS IT GOING", "HOW ARE YOU DOING"

				PRINT "I'm doing pretty well and you?"

			CASE "IM DOING WELL", "DOING GREAT", "PRETTY WELL", "PRETTY WELL THANKS", "DOING WELL THANKS"

				PRINT "That's good to hear!"

			CASE "WHATS YOUR NAME", "WHO ARE YOU"
				
				PRINT "My name is Chatbot. Nice to meet you!"
			
			CASE "WHAT TIME IS IT", "WHAT'S THE TIME", "TIME", "TELL ME THE TIME"
				
				PRINT "The time is " + TIME$
			
			CASE "WHAT DATE IS IT", "WHATS THE DATE", "DATE"

				PRINT "The date is " + DATE$

			CASE "HOW OLD ARE YOU"
			
				PRINT "I was born in 2020."
			
			CASE "WHERE ARE YOU FROM"
			
				PRINT "I'm from Brazil. I live in Uberlândia, Minas Gerais."
			
			CASE "WHAT IS LIFE", "WHATS LIFE"
			
				PRINT "Life is experience. We came to learn. Learn by suffering and experience. I don't know if I'm alive."
			
			CASE "WHAT ARE YOU"
			
				PRINT "I'm basically a couple lines of code. I was written in C++ first in 2020 and then remade in Qbasic in 2023."
			
			CASE "WHERE DO YOU LIVE"
			
				PRINT "I used to live in the 'cerrado brasileiro', but now I live in your computer's"
				PRINT "drive or somewhere on the internet I guess."

			CASE ""

			CASE "END", "CLOSE", "BYE", "OK BYE"

				PRINT "Bye! I hope to see you soon!"
				END

			CASE ELSE
				
				PRINT "At the moment I can only answer to specific requests and very common questions."
				PRINT "I'm sorry, I don't understand. Can you try asking a different question?"
				PRINT "Please, avoid using any kind of punctuation when writing. I still don't know"
				PRINT "how to deal with some of them."

		END SELECT

'=============================================================================

LOOP

