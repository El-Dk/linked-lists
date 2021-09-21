require './lib/linked_list'
c = []
20.times { |i| c << i + 1 }
p c
lista = LinkedList.new
20.times { |i| lista.prepend(i + 1) }
lista.show_list
puts "Size: #{lista.size}"
puts "Head: #{lista.head}"
puts "Tail: #{lista.tail}"
index = -15
puts "Node at #{index}: #{lista.at(index)}"
puts "POP: #{lista.pop}"
puts "POP: #{lista.pop}"
lista.show_list

