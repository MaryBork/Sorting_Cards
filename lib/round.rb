require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require 'pry'

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @correct_guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(response)

    response = "#{response[:value]} of #{response[:suit]}"
    current_guess = Guess.new(response, current_card)

      if current_guess.correct? == true
        @correct_guesses << current_guess
        @guesses << current_guess
      else
        @guesses << current_guess
      end

    return current_guess
  end

  def number_correct
     @correct_guesses.count
  end

  def percent_correct
     number = number_correct.to_f/ @guesses.count.to_f
     number * 100
  end

end
