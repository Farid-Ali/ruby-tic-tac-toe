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
  def initialize
    #set up the board
    @board = Board.new
    #set up the player
    @player_x = Player.new("Madam X", :x, @board)
    @player_y = Player.new("Mister Y", :y, @board)
    #assign the starting player
    @current_player = @player_x
  end

  #play
  def play
    #loop infinitely
    loop do
      #call the board rendering method
      @board.render
      #ask for coordinates from the current player
      @current_player.get_coordinates
      #break the loop if the game is over
      break if check_game_over
      #switch players
      switch_players
    end
  end
  
  #check_game_over
  def check_game_over
    #check_victory
    check_victory ||
    #check_draw
    check_draw
  end

  #check_victory
  def check_victory
    #if board says current player's piece has
    #a winning_combination?
    if @board.winning_combiantion?(@current_player.piece)
      #display a victory message
      puts "Congratulations #{@current_player.name}, you win!"
      true
    else
      false
    end
  end

  #check_draw
  def check_draw
    #if board says we've filled up
    if @board.full?
      #display a draw message
      puts "Match Draw!"
      true
    else
      false
    end
  end

  #switch_players
  def switch_players
    #playerX >> playerO or vice versa
    if @current_player == @player_x
      @current_player = @player_y
    else
      @current_player = @player_x
    end
  end

end


#Manage all player-related functionality
class Player
  attr_accessor :name, :piece
  #initialize
  def initialize(name = "Mystery_player", piece, board)
    #set marker type (e.g. X or O)
    raise "Piece must be a symbol!" unless piece.is_a?(Symbol)
    @name = name
    @piece = piece
    @board = board
  end

  #get_coordinates
  def get_coordinates
    #loop infinitely
    loop do
      #ask_for_coordinates
      coordinates = ask_for_coordinates
      #if validate_coordinate_format is true
      if validate_coordinate_format(coordinates)
        #if piece can be placed on board
        if @board.add_piece(coordinates, @piece)
          #break the loop
          break
        end
      end
    end
  end

  #ask_for_coordinates
  def ask_for_coordinates
    #display message asking for coordinates
    puts "#{@name}(#{@piece}), enter your coordinates in the form x,y: "
    #pull coordinates from command line
    gets.strip.split(",").map(&:to_i)
  end

  #validate_coordinate_format
  def validate_coordinate_format(coordinate)
    #unless coordinates are in the proper format
    if coordinate.is_a?(Array) && coordinate.size == 2
      true
    else
      #display error message
      puts "Your coordinates are in the improper format!"
    end
  end

end


#Maintains game board state
class Board
  #initialize board
  def initialize
    #set up blank data structure
    @board = Array.new(3){Array.new(3)}
  end

  #render
  def render
    puts
    #loop through data structure
    @board.each do |row|
      row.each do |cell|
        #display an existing marker if any, else blank
        cell.nil? ? print("-"): print(cell.to_s)
      end
      puts
    end
    puts
  end

  #add_piece
  def add_piece(coordinate, piece)
    #if piece_location_valid?
    if piece_location_valid?(coordinate)
      #place piece
      @board[coordinate[0]][coordinate[1]] = piece
      true
    #else
    else
      false
      #display error message
      puts "Invalid Location!"
    end
  end

  #piece_location_valid?
  def piece_location_valid?(coordinate)
    #is the placement within_valid_coordinate?
    if within_valid_coordinates?(coordinate)
    #are the piece coordinates_available?
      coordinates_available?(coordinate)
    end
  end

  #within_valid_coordinates?
  def within_valid_coordinates?(coordinate)
    #unless piece coordinate are in the acceptible range
    if (0..2).include?(coordinate[0]) && (0..2).include?(coordinate[1])
      true
    else
      #display an error message
      puts "Piece coordinates are out of bounds"
    end
  end

  #coordinates_available?
  def coordinates_available?(coordinate)
    #unless piece coordinates are not occupied
    if @board[coordinate[0]][coordinate[1]].nil?
      true
    else
      #display error message
      puts "There is already a piece there!"
    end
  end

  #winning_combiantion?
  def winning_combiantion?(piece)
    #is there a winning_diagonal?
    winning_diagonal?(piece) ||
    #or winning_vertical?
    winning_vertical?(piece) ||
    #or winning_horizontal? for that piece?
    winning_horizontal?(piece)
  end

  #winning_diagonal?
  def winning_diagonal?(piece)
    #check if specified piece has a triplet across diagonals
    diagonals.any? do |diag|
      diag.all?{|cell| cell == piece}
    end
  end
    
  #winning_vertical?
  def winning_vertical?(piece)
    #check if specified piece has a triplet across verticals
    verticals.any? do |vert|
      vert.all?{|cell| cell == piece}
    end
  end

  #winning_horizontal?
  def winning_horizontal?(piece)
    #check if specified piece has a triplet across horizontals
    horizontals.any? do |horz|
      horz.all?{|cell| cell == piece}
    end
  end

  #diagonals
  def diagonals
    #return the diagonal pieces
    [[ @board[0][0], @board[1][1], @board[2][2] ],[ @board[2][0], @board[1][1], @board[0][2] ]]
  end

  #verticals
  def verticals
    #return the vertical pieces
    @board
  end

  #horizontals
  def horizontals
    #return the horizontal pieces
    horizontals = []
    3.times do |i|
      horizontals << [@board[0][i], @board[1][i], @board[2][i]]
    end
    horizontals
  end

  #full?
  def full?
    #does every square contain a piece?
    @board.all? do |row|
      row.none?(&:nil?)
    end
  end
end

terminal = TicTacToe.new
terminal.play