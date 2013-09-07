require_relative 'view.rb'
require_relative 'model.rb'

class Controller

  def initialize
    @deck_object = Deck.new 
    @view        = View.new
    @input       = nil
    @question_count    = 0
    @guess_counter     = 1
    @deck_array_index  = 0
  end

  def play!
    send_intro_to_view
    until @question_count >= deck_object.deck_array.length
      pull_question
      show_a_question
      get_input
      pull_answer
      check_guess
    end
  end

  private
  attr_reader :view, :deck_object

  def send_intro_to_view
    view.display_prompt
  end

  def get_input
    @input = view.get_typing
  end

  def show_a_question
    view.display_question(@pulled_question)
  end

  def check_guess
    if @input == @pulled_answer
      view.display_correct_answer
        next_card
        @question_count += 1
    elsif @input != @pulled_answer && @guess_counter == 3    
      view.display_incorrect_next_card
        next_card
      @question_count += 1
      @guess_counter = 1
    else
      view.display_incorrect_answer
        @guess_counter += 1
    end
  end

  def pull_question
   @pulled_question = deck_object.deck_array[@deck_array_index].question
  end

   def pull_answer
   @pulled_answer = deck_object.deck_array[@deck_array_index].answer
  end

  def next_card
    @deck_array_index += 1
  end
end


supernintendo_chalmers = Controller.new
supernintendo_chalmers.play!
