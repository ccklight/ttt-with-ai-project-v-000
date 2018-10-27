require 'pry'
class Game  
 
  attr_accessor :board, :player_1, :player_2 
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
  [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

    def initialize(player_1 = Players::Human.new("X"),  player_2 = Players::Human.new("O"), board = Board.new)
      @board = board 
      @player_1 = player_1
      @player_2 = player_2
    end 
  
    def current_player
      @board.turn_count % 2 == 0 ?  @player_1 : @player_2
    
    end 
  
     def won?
      WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0] +1)
      end
    end
    
    def draw?
      @board.full? && !won?
    end 
  
    def over? 
      won? || draw? 
    end 
    
    def winner 
      if won = won? 
        board.cells[won.first]
          end 
    end

      
    def turn 
      player = current_player
        if @board.current_player
          puts "Please enter 1-9."
          turn 
        else 
        @board.update(current_player)
        @board.display(current_player)
          end
    end 
 #binding.pry

end