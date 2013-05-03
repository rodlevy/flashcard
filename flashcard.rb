require_relative 'model.rb'
class Controller

  def initialize(file)
    create_new_deck(file)
    user_interface
  end

  def create_new_deck(file)
    @new_deck = Deck.new(file)
    @new_deck.shuffle!
  end

  def user_interface
    @view = View.new
    @view.welcome_prompt
    sleep 2
    run_game
  end

  def display_definition(card)
    @view.display_definition(card)
  end
  
  def user_guess
    @new_deck.guess(@view.get_guess)
  end
  def run_game
    until @new_deck.deck_empty?
          display_definition(@new_deck.next_card)
          user_guess
          # @new_deck.guess(@view.get_guess)
        end
  end


=begin 
Controller 
deck.shuffle
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
    puts "Guess:"
    @guess = gets.chomp
  end

  def welcome_prompt
    puts "Welcome to Ruby Flashcards"
  end

  def display_definition(card_definition)
   puts "Definition: \n#{card_definition}"
  end

end

test = Controller.new('flashcard_samples.txt')
