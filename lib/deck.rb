require 'pry'
require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if index - 1 <= @cards.length
      @cards[index].rank
    else
      "No card found at index"
    end
  end
  def high_ranking_cards
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    percent = (high_ranking_cards.count.to_f / cards.count.to_f) * 100
    percent.round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end

end
