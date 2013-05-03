require 'csv'
require 'pry'


class Card
  attr_reader :answer, :definition
  def initialize(answer, definition)
    @answer = answer
    @definition = definition
  end

  def to_s
    "#{definition}: #{answer}"
  end

  def correct?(input)
    input == answer
  end
end

class Deck

  attr_reader :false_deck, :true_deck, :working_deck
  def initialize(file_name)
    @false_deck = []
    @true_deck = []
    @working_deck = []
    load(file_name)
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

  def guess(guess)
    if @working_deck[0].correct?(guess)
      @true_deck << @working_deck.shift
      true
    else
      @false_deck << @working_deck.shift
      false
    end
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
  end

  def next_card
    @working_deck[0].definition
  end

  def num_correct
    @true_deck.length
  end

  def num_wrong
    @false_deck.length
  end

end

