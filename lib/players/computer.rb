module Players
  class Computer < Player

    # Define space types
    CENTER = 5
    EDGES = [2, 5, 6, 7]
    CORNERS = [1, 3, 7, 9]

    def initialize(token)
      super
      @opponents_spaces = []
      @my_spaces = []
      @open_spaces = []
    end

    # Computer will iterate through this array to see
    # if indexes 0 and 1 contain the same token.
    # If so, it will place its token in the space
    # indicated by index 2 to block or win the game.
    win_or_block = [
      [1, 2, 3], [2, 3, 1], [4, 5, 6], [5, 6, 4],
      [7, 8, 9], [8, 9, 7], [1, 4, 7], [4, 7, 1],
      [2, 5, 8], [5, 8, 2], [3, 6, 9], [6, 9, 3],
      [1, 5, 9], [5, 9, 1], [3, 5, 7], [5, 7, 3],
      [1, 7, 4], [2, 8, 5], [3, 9, 6], [1, 3, 2],
      [4, 6, 5], [7, 9, 8], [1, 9, 5], [3, 7, 5]
    ]

    def danger?
      dangerous_combo = nil
      win_or_block.each do |c|
        dangerous_combo << c if board.taken?(c[0]) && board.taken?(c[1]) && board.cells[c[0]] == board.cells[c[1]] && !board.taken?(c[2])
      end
      dangerous_combo
    end



    def view_board
      @my_spaces.clear
      @opponents_spaces.clear
      @open_spaces.clear
      i = 1
      until i = 9 do
        if board.taken?(i)
          if board.cells[i - 1] == self.token
            my_spaces << i
          else
            opponents_spaces << i
          end
        else open_spaces << i
        end
      end
    end

    def choose(index)
      index.to_s
    end


    def move(board)
      view_board
      if board.turn_count == 0        
          choose(CENTER)
        elsif board.turn_count == 1 && !board.taken?(CENTER)
          choose(CENTER)
        elsif board.turn_count == 1 && board.taken?(CENTER)
          choose(CORNERS.sample)
        elsif board.turn_count == 2 && @my_spaces == [5] && @opponents_spaces == [2]
          choose([7, 9].sample)
        elsif board.turn_count == 2 && @my_spaces == [5] && @opponents_spaces == [4]
          choose([3, 9].sample)
        elsif board.turn_count == 2 && @my_spaces == [5] && @opponents_spaces == [6]
          choose([1, 7].sample)
        elsif board.turn_count == 2 && @my_spaces == [5] && @opponents_spaces == [8]
          choose([1, 3].sample)
        
      elsif danger?
        choose(danger?[2])
      else choose(@open_spaces.sample)
      
    end


  end
end
