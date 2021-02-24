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
      input = input.to_i - 1
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
      if input = "X" || input = "O"
    count += 1
      end
      @board.count

  #binding.pry
  end
  
    #binding.pry
  end
end
  
    