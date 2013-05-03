class Controller

  def initialize()
    create_new_deck
    user_interface
  end

  def create_new_deck
    @new_deck = Deck.new
  end

  def user_interface
    @view = View.new
    @view.welcome_prompt
  end

  def display_definition(card)
    @view.display_definition(card.definition)
  end
  
  def user_guess
    @view.get_guess
  end

  
=begin 
Controller 
next_card 
get input - guess 
card.correct?
if true push to true array from false array
  next card
elsif false loop to check card
check for deck finished?
check if deck is empty?
  if empty 
    startagain?
  if cards loop through remaining false array.
=end 
  


end

class View

  def initialize


  end

  def new_card
    @new_card
  end
  
  def get_guess
    @guess = gets.chomp
  end

  def welcome_prompt
    puts "Welcome to Ruby Flashcards"
  end

  def display_definition(card_definition)
    @card_definition
  end

end
