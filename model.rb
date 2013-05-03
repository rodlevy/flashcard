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

end

class Deck

  attr_reader :false_array, :true_array, :working_array
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
    if correct?(guess)
      @true_array << @working_array.shift
      true
    else
      @false_array << @working_array.shift
      false
    end
  end

  def correct?(guess)
    guess.downcase == @working_array[0].answer.downcase
  end

  def finished?
    @working_array.empty?
  end

  def empty?
    @false_array.empty? && @working_array.empty?
  end

  def start_over!
    @working_array << @false_array
    @false_array = []
    @working_array.flatten!
  end

  def next_card
    @working_array[0].definition
  end
  
  def next_card_answer
    @false_array.last.answer
  end

  def num_correct
    @true_array.length
  end

  def num_wrong
    @false_array.length
  end


end


