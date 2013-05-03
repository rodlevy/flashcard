require_relative 'model'

deck = Deck.new('test_flash.txt')

puts deck.guess('alias') == true
puts deck.guess('and') == true
puts deck.guess('begin') == true

puts deck.true_array

puts deck.guess('alias') == false
puts deck.guess('asdf') == false

puts deck.false_array

puts deck.finished? == true
puts deck.empty? == false

deck.start_over!
puts deck.working_array.empty? == false
puts deck.false_array.empty? == true
puts deck.true_array
