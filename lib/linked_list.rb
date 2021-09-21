require './lib/node'

# LinkedList class definition
class LinkedList
  def initialize
    @head, @tail = nil, nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    @size += 1
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    @size += 1
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def show_list
    a = @head
    until(a.nil?)
      puts a.value
      a = a.next_node
    end
  end

  def size
    @size
  end
  
  def head
    @head.value
  end
  
  def tail
    @tail.value
  end

  def at(index)
    index = index.abs - 1 if(index < 0)
      
    return nil if(index >= @size)
    
    current_index = 0
    node = @head
    until(current_index == index)
      current_index += 1
      node = node.next_node
    end
    node.value
  end

  def pop
    return nil if(@head.nil?)
    
    node = @head
    if(node.next_node.nil?)
      @head = nil
      @tail = nil
      return node.value
    end
    node = node.next_node until(node.next_node.next_node.nil?)
    @tail = node
    node = node.next_node
    @tail.next_node = nil
    node.value
  end
end
