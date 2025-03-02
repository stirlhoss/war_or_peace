require 'rspec'
require './lib/card'
require './lib/deck'
 
describe Deck do
  it 'exists' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end
end

describe '#cards' do
  it 'returns arrary of cards' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end
end

describe '#rank_card_at' do
  it 'tells the rank of card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # binding.pry

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
    expect(deck.rank_of_card_at(5)).to eq("No card found at index")
  end
end

describe '#high_ranking_cards' do
  it 'will return all cards in deck with rank >= 11' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.high_ranking_cards).to eq([card1, card3])
  end
end

describe '#percent_high_ranking' do
  it 'will return a float of the percent of cards that have a rank >= 11' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq 66.67
  end
end

describe '#remove_card' do
  it 'will remove first card from deck (draw)' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
  end
end

describe 'method check' do
  it 'Checks to make sure other methods still function' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card

    expect(deck.high_ranking_cards).to eq [card3]
    expect(deck.percent_high_ranking).to eq(50.00)
  end
end

describe '#add_card' do
  it 'will add individual cards to deck' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    deck.remove_card
    deck.add_card(card4)

    expect(deck.cards).to eq([card2, card3, card4])
  end
end

describe 'method check' do
  it 'Checks to make sure other methods still function'do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    deck.remove_card
    deck.add_card(card4)

    expect(deck.high_ranking_cards).to eq [card3]
    expect(deck.percent_high_ranking).to eq(33.33)
  end
end
