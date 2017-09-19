class DFSPlayerRankings::CLI

  def call
    DFSPlayerRankings::Scraper.new.make_players
    puts "Welcome to the top DFS players in the world"
    start
  end

  def start
    puts ""
    puts "Which rankings system would you like to see? Overall, TPOY, Super, Heavy, and Mid"
    input = gets.strip.to_i

    print_players(input)

    puts ""
    puts "What player would you like more information on?"
    input = gets.strip

    player = DFSPlayerRankings::Player.find(input.to_i)

    print_player(player)

    puts ""
    puts "Would you like to see another player? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thank you! Have a great day!"
      exit
    end
  end

  def print_player(player)
    puts ""
    puts "----------- #{player.name} - #{player.rank} -----------"
    puts ""
    puts "Highest Scores:           #{player.highestscores}"
    puts ""
  end

  def print_players(from_number)
    puts ""
    puts "---------- Players #{from_number} - #{from_number+9} ----------"
    puts ""
    DFSPlayerRankings::Player.all[from_number-1, 10].each.with_index(from_number) do |player, index|
      puts "#{index}. #{player.name} - #{player.rank}"
    end
  end

end