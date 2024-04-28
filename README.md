# QB_ChatBot

Pretty BASIC ChatBot made in Qbasic that is able to respond to some simple sentences and questions and can also repond to some commands like 'roll a D6', 'What time is it?', 'Remember something', etc. It can take some notes of tasks and keep simple reminders.

===============================================

' Here is a list of the commands and requests you can use: 

' What time is it? - To ask for the current time.
' What date is it? - To ask for the current date.
' Remind me - To remind you about something.
' Roll a D6 - To roll a D6 DIE.
' Task - It will remind you of something you have to do.
' Forget everything - It will forget all tasks and reminders.
' Forget reminder - It will forget the reminders.
' Forget task - It will forget the tasks.
' What do you have for me? - It'll tell you about all your tasks and reminders.
' I'm bored what can I do? - It'll suggest you some random activity for you to do.
' Bye - It will finish the conversation and end the program.

===============================================

NOTES:

[Working on V0.4]

V 0.3

- MODIFY AN SPECIFIC CONTACT
- Be able to edit information of an specific contact.
- Show AGENDA in the right alphabetical order. SORT A-Z.
- Show message when writing an unexisting contact name:
  "The contact isn't part of the agenda" or something similar...
- Improve SAVING and LOADING with "FOR i... NEXT" i instead of "DO...LOOP".
- DELETE ALL CONTACTS
- DELETE A SPECIFIC CONTACT
- SHOW A SPECIFFIC CONTACT CBU
- SHOW A SPECIFFIC CONTACT PHONE NUMBER
- SHOW A SPECIFFIC CONTACT EMAIL
- SHOW A SPECIFFIC CONTACT ADDRESS
- SOLVE BUG WHEN DELETING CONTACTS & SHOWING THEM
- AGENDA: New contacts always added in the nearest empty slot available.
- AGENDA commands added. General functinality and visuals improved.
- Color added to the text, visual enhanced.
- Now you can add a contact's birthday, and the Chatbot will store it in its memory.
  Upon startup, it will check for upcoming birthdays and notify you.
  This feature draws inspiration from Facebook's birthday notifications.
- Resolved bugs related to birthday reminders.
- Implemented Birthday Reminders.
- DELETE a specific TAG.
- TAGGED NOTES: Added validation for tagged notes.
- Duplicate Entries: When adding tags or notes, ensure to check if the entry already exists
  to avoid duplicates.
- When a tag is found, a new note will now be associated with the existing tag.
- Capability to delete all tags.
- Introduced commands to SHOW NOTES.
- Check for the existence of a tag before adding it.
- Bug: REDO FROM START when writing commas SOLVED! Thanks to AHMAD-511.
  Solved throughout the program using LINE INPUT instead of INPUT.
- AGENDA: CONTACTS
- ADD CONTACTS [ADD CONTACT] --> Can now store up to 100 contacts.
- YOU CAN ADD BANK INFORMATION - CBU TO THE CONTACTS
- SHOW ALL CONTACTS [SHOW CONTACTS]
- SHOW A SPECIFIC CONTACT
- SHOW LIST OF EMAILS --> NAME: EMAILS
- SHOW LIST OF PHONE NUMBERS --> NAME: NUMBER
- SHOW LIST OF ADDRESSES --> NAME: ADDRESS

V 0.2

- ChatBot able to remember at least 10 different tasks for you.
- ChatBot able to forget these 10 tasks.
- SOUND: Notification sound [BEEP] when you have a task or a reminder.
- ChatBot tells you when there aren't any tasks for you.
- ChatBot able to roll a D6 and generate a random number from 1 to 6.
- D6 graphics made with ASCII characters.
- AGAIN: Repeats the last command. Useful when rolling dice for instance.
- CLEAR SCREEN: you can CLS the screen.
- Help --> Located in the SUB called Help now.
- ABOUT: Shows current software version and other relevant information.

V 0.1

- First basic structure and algorithm of the program. Base code, basic
  structure planned and created in C++ then in QBASIC.
