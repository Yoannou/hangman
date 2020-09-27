An implementation of the classic word-guessing game, hangman!

This project randomly generates a word from a large list. Players have a certain amount of guesses to determine the word. Players can save their game as well ('save'), in which case it will be serialized and stored, or exit the game at any time ('exit').

FUTURE FIXES:

- Overhaul the entire project to run in the web browser with HTML, CSS, and Javascript
- Incorpirate graphical animations and SFX
- Seriously clean up Ruby code
- Include the ability to wipe all save data and start fresh, and delete save files (maybe as a menu)
- Allow user to type "man" or "manual" to print a user manual file to the screen
- Allow user to see turns remaining and other metadata mid-game
- Similarly, display this info every time the user loads a new game
- Ensure user only inputs one char and not a string other than "save" or "exit"
- Find a way to not bother initializing a new game in game.rb if the user chooses to load
- Create different return values for victory and defeat rather than just the @game_over variable
- Reduce number of class and class instance variables
- Find a less obscure list of words