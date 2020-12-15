Creating a Tic Tac Toe Game with Ruby:

Building games is a great way to learn about object oriented programming, good design practices, and the structure of Ruby gems. This post describes how to build a well-tested Ruby tic-tac-toe game that runs on the command line.

Objective

The tic-tac-toe gem can be played by two humans on the command line. The tic-tac-toe board is a 3 X 3 grid and players alternate turns until one player is victorious or the game ends in a draw. Players win by securing three consecutive positions on a row, column, or diagonal. The game ends in a tie if neither player has won and all positions on the board are taken.

Program design

Object oriented code should be organized in single-purpose classes, so it is easier to maintain and modify. Describing a program in plain English and identifying the nouns in the description is a good way to identify classes in a program. The objective’s description mentioned players, a board, positions on a board (aka a cell) and the tic-tac-toe game and these nouns will form the application’s classes. The verbs used in the objective will correspond to behavior we give objects in the form of methods.

Creating a Ruby gem

Ruby libraries are typically organized in a certain gem structure, so they are easy to host and include in other projects. When creating a Ruby library, it is wise to follow the gem structure to take advantage of built-in benefits and make it easier for other Ruby developers to follow your code. The Bundler gem makes it easy to create a gem called tic_tac_toe:

>> bundle gem tic_tac_toe
(run this command where you want to create this project)
This will create a repository.

The directory structure provided by the gem will be explained as we write the application code.

