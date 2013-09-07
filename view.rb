

class View

  def get_typing
    gets.chomp
  end

  def display_prompt
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
    puts
  end

  def display_question(question)
    puts question 
  end

  def display_correct_answer
    puts "Correct!"
  end

  def display_incorrect_answer
    puts "Incorrect - try again..."
  end

  def display_incorrect_next_card
    puts "Three strikes and you're out!"
    puts
  end

end
