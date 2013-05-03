require 'csv'
require 'pry'


class Card
  attr_reader :answer, :definition
  def initialize(answer, definition)
    @answer = answer
    @definition = definition
  end
end

class Deck
  def initialize(file_name)
    @false_array = []
    @true_array = []
    @working_array = []
    load(file_name)
  end

  def load(file_name)
    all_rows = []
    File.open(file_name).each_line do |line|
      all_rows << line
    end
    all_rows.each_slice(3) do |card|
      @working_array << Card.new(card[1].chomp, card[0].chomp)
    end
  end

  def shuffle!
    @working_array.shuffle!
  end

  def guess(guess)
    if guess.correct?
      @true_array << @working_array.shift
      true
    else
      @false_array << @working_array.shift
      false
    end
  end

  def correct?(guess)
    guess.downcase == card.answer.downcase
  end

  def deck_empty?
    @working_array.empty?
  end

  def 
  end


end



deck = Deck.new('flashcard_samples.txt')

deck
