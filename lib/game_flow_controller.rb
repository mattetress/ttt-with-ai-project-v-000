class GameFlowController

  def start
    puts "Hi! Welcome to Tic Tac Toe!"
    puts "What type of game would you like to play?"
    puts "1. 0 Player"
    puts "2. 1 Player"
    puts "3. 2 Player"
    puts "Please enter your selection:"
    input = gets.chomp
    input
  end

  def zero_player
    game = Game.new(Players::Computer("X"), Players::Computer("O"), Board.new)
    game.play
  end
end
