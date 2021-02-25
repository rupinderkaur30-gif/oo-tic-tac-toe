 require "pry" 
  
  class TicTacToe
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

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
        
        def display_board
            puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
            puts "-----------"
            puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
            puts "-----------"
            puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
          end 

          def input_to_index(input)
           index =  input.to_i - 1
          end

        def move (index , value)
        @board[index] = value
          #binding.pry
        end

        def position_taken?(index)
          #binding.pry
         if @board[index].nil? || @board[index] == " "
         false
         else 
          true
         end
        end

      def valid_move?(input)
        #binding.pry
        if position_taken?(input)==false && input.between?(0,8)
         true
        else
          false
        end
      end

      def turn
        puts "enter between (1,9)"
      input = gets.strip
      input = input_to_index(input)
      if valid_move?(input)
        move(input,current_player)
        display_board
      else
        turn
    end
  end

  def turn_count
    count = 0
    @board.each do | input| 
      if input == "X" || input == "O"
       count += 1
      end
    end
    count
  end 

  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
    #binding.pry
  end

 def won? 
  WIN_COMBINATIONS.each do  |index|
    #binding.pry
    position_1 = @board[index[0]]
    position_2 =  @board[index[1]]
    position_3 = @board[index[2]]

   if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||  (position_1 == "O" && position_2 == "O" && position_3 == "O")
     return index
    end
  end
  return false
  #
end

def full?
   @board.all? {|index| index == "X" || index == "O"}
end

def draw?
    !won? && full? 
end

def over?
  won? || draw? 
end

def winner
    combo = won?
    if combo == false
      return nil
    end
    #binding.pry
    if @board[combo[1]] == "X"
    return "X"
    else 
     "O"
    end
 end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
   



  
    