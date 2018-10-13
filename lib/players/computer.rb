module Players
  class Computer < Player

    # Define space types
    CENTER = 5
    EDGES = [2, 5, 6, 7]
    CORNERS = [1, 3, 7, 9]

    @opponents_spaces = []
    @my_spaces = []

    def view_board
      i = 1
      until i = 9 do
        board.cells[i]
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
      end
    end


  end
end
