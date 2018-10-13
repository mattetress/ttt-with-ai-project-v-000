module Players
  class Computer < Player

    # Define space types
    CENTER = 5
    EDGES = [2, 5, 6, 7]
    CORNERS = [1, 3, 7, 9]

    @opponents_spaces = []
    @my_spaces = []

    close_to_winning = [
      [1, 2], [2, 3], [4, 5], [5, 6],
      [7, 8], [8, 9], [1, 4], [4, 7],
      [2, 5], [5, 8], [3, 6], [6, 9],
      [1, 5], [5, 9], [3, 5], [5, 7]
    ]

    def view_board
      i = 1
      until i = 9 do
        if board.taken?(i)
          if board.cells[i - 1] == self.token
            my_spaces << i
          else
            opponents_spaces << i
          end
        end
      end
    end

    def choose(index)
      index.to_s
    end


    def move(board)
      case board.turn_count
        when 0
          choose(CENTER)
        when 1 && !board.taken?(CENTER)
          choose(CENTER)
        when 1 && board.taken?(CENTER)
          choose(CONRERS.sample)
        when 2 && my_spaces == [5] && opponents_spaces == [2] 
          choose([7, 9].sample)
        when 2 && my_spaces == [5] && opponents_spaces == [4]
          choose([3, 9].sample)
        when 2 && my_spaces == [5] && opponents_spaces == [6]
          choose([1, 7].sample)
        when 2 && my_spaces == [5] && opponents_spaces == [8]
          choose([1, 3].sample)
      end
    end


  end
end
