require_relative 'model'
require 'pry'

deck = Deck.new('test_flash.txt')

puts deck.guess('alias') == true

puts deck.guess('and') == true
puts deck.guess('BEGIN') == true

puts deck.true_deck

puts deck.guess('alias') == false
puts deck.guess('asdf') == false

puts deck.false_deck

puts deck.finished? == true
puts deck.empty? == false

deck.start_over!
puts deck.working_array.empty? == false
puts deck.false_deck.empty? == true
puts deck.true_deck
