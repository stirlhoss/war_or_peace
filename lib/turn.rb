require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :discard

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @discard = []
    @turn_type = nil
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @turn_type = :basic
    elsif
      # if player1.deck.cards.count >= 3 && player2.deck.cards.count >= 3
        player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      # else

      # end
      @turn_type = :war
    else
      @turn_type = :mutually_assured_destruction
    end
  end

  def winner
    # binding.pry
    if @turn_type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif @turn_type == :war
      if player1.deck.cards.count >= 3 && player2.deck.cards.count >= 3
        if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
          player1
        else
          player2
        end
      elsif player1.deck.cards.count >= 3 && player2.deck.cards.count < 3
        player1
      else
        player2
      end
    else
      "No Winner"
    end
  end

  def pile_cards
    # binding.pry
    if @turn_type == :basic
      @spoils_of_war << player1.deck.cards.shift << player2.deck.cards.shift
      @spoils_of_war.flatten!
    elsif @turn_type == :war
      @spoils_of_war << player1.deck.cards.shift(3) << player2.deck.cards.shift(3)
      @spoils_of_war.flatten!
    elsif @turn_type == :mutually_assured_destruction
      @discard << player1.deck.cards.shift(3) << player2.deck.cards.shift(3)
      @discard.flatten!
    end
  end

  def award_spoils(winner)
    if winner == player1 || player2
    winner.deck.cards << @spoils_of_war
    winner.deck.cards.flatten!
    @spoils_of_war = []
    else
      exit
    end
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{player1.name} and #{player2.name}. Type 'GO' to start the game!"
    puts "----------------------------------"
    play = gets.chomp
    if play == "GO" || "Go" || "go"
      puts "Let the War commence..."
    else
      exit!
    end
  end

end
