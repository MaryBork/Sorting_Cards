require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'
require 'pry'


class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4","Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4","Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Deck, round.deck
  end

  def test_it_takes_guesses
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4","Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_current_card
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4","Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_records_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Guess, round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.guesses.count
  end

  def test_recorded_guess_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({ value: "3", suit: "Hearts"})
    assert_equal "Correct!", round.guesses.first.feedback
  end

   def test_correct_guess_count
   card_1 = Card.new("3","Hearts")
   card_2 = Card.new("4", "Clubs")
   deck = Deck.new([card_1, card_2])
   round = Round.new(deck)
   round.record_guess({ value: "3", suit: "Hearts"})
   assert_equal 1, round.number_correct
   end

  def test_recorded_guess_negative_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({ value: "3", suit: "Hearts"})
    round.record_guess({ value: "Jack", suit: "Diamonds"})
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 2, round.guesses.count
    assert_equal 1, round.number_correct
  end


  def test_percent_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({ value: "3", suit: "Hearts"})
    round.record_guess({ value: "Jack", suit: "Diamonds"})
    assert_equal 50, round.percent_correct
  end

end
