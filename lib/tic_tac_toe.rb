class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    cp = current_player
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      turn
    end
  end
  
  
def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end 
  

  def full?
    @board.any?{|occupy| occupy != " "}
  end
  
  def draw?
    !(won?) && (full?)
  end
  
  def over?
    won? || full? || draw?
  end
  
  
 def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end
  
  
  def play
    @board = Array.new(9, " ")
    # Play until someone wins or there is a draw
    turn until over?
    # Congratulate the winner
    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    # Ask if they'd like to play again
    puts "Would you like to play again? (Y or N)"
    # If yes, then #play again
    gets.strip.downcase == "y" || gets.strip.downcase == "yes" ? play : puts("Goodbye!")
  end
 
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
end