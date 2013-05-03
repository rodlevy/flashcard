require_relative 'model.rb'
require 'colorize'

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
    until @new_deck.finished?
      @view.display_definition(@new_deck.next_card)
      if user_guess
        puts "Katie Perry now sits on your lap!".green
        puts
      else
        puts "Incorrect: Please consult with KT Perry".red
        puts "Answer: #{@new_deck.next_card_answer}".red
        puts 
      end
    end

    puts "Correct: #{@new_deck.num_correct}"
    puts "Incorrect: #{@new_deck.num_wrong}\n"

    if @new_deck.empty?
      puts "You are the biggest winner!!"
    else
      puts "Do you want to finish your previous mistakes?"
      try_again = gets.chomp
      if try_again == "yes"
        @new_deck.start_over!.shuffle!
        run_game
      else
        puts "you loser"
      end
    end
  end
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
    puts "Welcome to Ruby Flashcards".yellow
  end

  def display_definition(card_definition)
   puts "Definition: \n#{card_definition}".blue
  end

end

test = Controller.new('test_flash.txt')
