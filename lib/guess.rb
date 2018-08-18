require './lib/card.rb'
require 'pry'

class Guess
  attr_reader :response,
              :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    correct_card = "#{card.value} of #{card.suit}"
    if correct_card == @response
      true
    else
      false
    end
  end

 def feedback
   if correct? == true
     p "Correct!"
   else
     p "Incorrect."
   end
 end

end
