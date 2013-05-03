require 'csv'
require 'pry'


class Card
  attr_reader :answer, :definition
  def initialize(answer, definition, attempts = 0)
    @answer = answer
    @definition = definition
    @attempts = attemps
  end

  def to_s
    "#{definition}: #{answer}"
  end
  
  def correct?(guess)
    guess == answer
  end

  def attempted!
    @attempts += 1
  end

end

class Deck

  attr_reader :false_deck, :true_deck, :working_deck, :current_card

  def initialize(file_name)
    @false_deck = []
    @true_deck = []
    @working_deck = []
    load(file_name)
    set_current_card
  end

  def load(file_name)
    all_rows = []
    File.open(file_name).each_line do |line|
      all_rows << line
    end
    all_rows.each_slice(3) do |card|
      @working_deck << Card.new(card[1].chomp, card[0].chomp)
    end
  end

  def shuffle!
    @working_deck.shuffle!
  end

  def sort!
    @working_deck.sort_by { |card| card.attempts }.reverse
  end

  def guess(guess)
    @current_card.attempted!
    if @current_card.correct?(guess)
      @true_deck << @current_card
      set_current_card
      true
    else
      @false_deck << @current_card
      set_current_card
      false
    end
  end

  def set_current_card
    @current_card = @working_deck.shift
  end

  def finished?
    @working_deck.empty?
  end

  def empty?
    @false_deck.empty? && @working_deck.empty?
  end

  def start_over!
    @working_deck << @false_deck
    @false_deck = []
    @working_deck.flatten!
    set_current_card
  end

  def next_card
    @current_card.definition
  end
  
  def next_card_answer
    @false_deck.last.answer
  end

  def num_correct
    @true_deck.length
  end

  def num_wrong
    @false_deck.length
  end

end


