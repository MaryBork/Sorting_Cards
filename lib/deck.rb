require './lib/card.rb'
require './lib/deck.rb'
require 'pry'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
   return @cards.length
 end

end
