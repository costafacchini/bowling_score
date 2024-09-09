require_relative 'base'

module Printer
  class ConsoleAdapter < Base
    def print(players)
      puts "#{print_header}#{print_players(players)}"
    end

    private

    def print_header
      "Frame\t\t#{(1..10).to_a.join("\t\t")}\n"
    end

    def print_players(players)
      players.map do |player|
        pinfalls = player.pinfalls.map do |frame|
          frame_scores = normalize_frame_score(frame)
          frame_scores.join("\t")
        end.join("\t")
        "#{player.name}\nPinfalls\t#{pinfalls}\nScore\t\t#{print_score(player)}"
      end.join("\n")
    end

    def print_score(player)
      player.pinfalls.map(&:total).join("\t\t")
    end
  end
end
