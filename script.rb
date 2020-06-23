############ HIGH LEVEL PSEUDOCODE ####################

#Set up the game initially[TicTacToe]
  #Create a game board[Board]
  #Create a couple players[Player]
#Start the game loop[TicTacToe]
  #Render the board[Board]
  #Ask for and validate the current player's coordinates[Player]
  #If the game should end[TicTacToe]
    #Display the proper victory or draw message
    #Stop looping
  #Else
    #Switch to the next player and keep looping[TicTacToe]

##########################################################


#Controls the game play
class TicTacToe
  #initialize
    #set up the board
    #set up the player
    #assign the starting player

  #play
    #loop infinitely
      #call the board rendering method
      #ask for coordinates from the current player
      #break the loop if the game is over
      #switch players
  
  #check_game_over
    #check_victory
    #check_draw

  #check_victory
    #if board says current player's piece has
    #a winning_combination?
      #display a victory message

  #check_draw
    #if board says we've filled up
      #display a draw message

  #switch_players
    #playerX >> playerO or vice versa
end


#Manage all player-related functionality
class Player
  #initialize
    #set marker type (e.g. X or O)

  #get_coordinates
    #loop infinitely
      #ask_for_coordinates
      #if validate_coordinate_format is true
        #if piece can be placed on board
          #break the loop

  #ask_for_coordinates
    #display message asking for coordinates
    #pull coordinates from command line
  
  #validate_coordinate_format
    #unless coordinates are in the proper format
      #display error message
end


#Maintains game board state
class Board
  #initialize board
    #set up blank data structure

  #render
    #loop through data structure
      #display an existing marker if any, else blank

  #add_piece
    #if piece_location_valid?
      #place piece
    #else
      #display error message

  #piece_location_valid?
    #is the placement within_valid_coordinate?
    #are the piece coordinates_available?

  #within_valid_coordinates?
    #unless piece coordinate are in the acceptible range
      #display an error message

  #coordinates_available?
    #unless piece coordinates are not occupied
      #display error message

  #winning_combiantion?
    #is there a winning_diagonal?
    #or winning_vertical?
    #or winning_horizontal? for that piece?

  #winning_diagonal?
    #check if specified piece has a triplet across diagonals
    
  #winning_vertical?
    #check if specified piece has a triplet across verticals

  #winning_horizontal?
    #check if specified piece has a triplet across horizontals

  #diagonals
    #return the diagonal pieces

  #verticals
    #return the vertical pieces

  #horizontals
    #return the horizontal pieces

  #full?
    #does every square contain a piece?
end