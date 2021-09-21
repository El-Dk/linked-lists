require './lib/linked_list'
c = []
20.times { |i| c << i + 1 }
p c
lista = LinkedList.new
20.times { |i| lista.prepend(i + 1) }
lista.to_s
puts "Size: #{lista.size}"
puts "Head: #{lista.head}"
puts "Tail: #{lista.tail}"
index = -15
puts "Node at #{index}: #{lista.at(index)}"
puts "POP: #{lista.pop}"
puts "POP: #{lista.pop}"
lista.to_s
p lista.contains?(1)
p lista.contains?(20)
puts "Find(1): #{lista.find(1)}"
puts "Find(3): #{lista.find(3)}"
lista.to_s
lista.insert_at(50, 10)
lista.to_s
lista.insert_at(500, lista.size)
lista.to_s
lista.insert_at(50, 10)
lista.to_s
lista.insert_at(500, lista.size)
lista.to_s
puts 'REMOVE'
lista.remove_at(10)
lista.to_s
lista.remove_at(10)
lista.to_s
lista.remove_at(-5)
lista.to_s
