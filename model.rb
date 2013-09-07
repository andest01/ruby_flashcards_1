
class Deck #model
  attr_reader :deck_array

  def initialize
    @deck_array = []
    load_deck
  end

  def load_deck
    sorted_deck = []
    flashcards = File.read('flashcard_samples.txt').split("\n\n")
    flashcards.each {|row| sorted_deck << row.split("\n") }
    sorted_deck.each {|row| @deck_array << Flashcard.new(row) }
    @deck_array
  end
end



class Flashcard #model
  attr_reader :question, :answer

  def initialize(card)
    @question = card[0]
    @answer   = card[1]
  end
end
