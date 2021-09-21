# frozen_string_literal: true

require './lib/node'

# LinkedList class definition
class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    @size += 1
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
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
    until a.nil?
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
    index = @size - index.abs if index.negative?

    return nil if index >= @size

    current_index = 0
    node = @head
    until current_index == index
      current_index += 1
      node = node.next_node
    end
    node.value
  end

  def pop
    return nil if @head.nil?

    node = @head
    if node.next_node.nil?
      @head = nil
      @tail = nil
      @size -= 1
      return node.value
    end
    node = node.next_node until node.next_node.next_node.nil?
    @tail = node
    node = node.next_node
    @tail.next_node = nil
    @size -= 1
    node.value
  end

  def contains?(value)
    contains = false
    node = @head
    until node.nil?
      if value == node.value
        contains = true
        break
      end
      node = node.next_node
    end
    contains
  end

  def find(value)
    contains = false
    index = 0
    node = @head
    until node.nil?
      if value == node.value
        contains = true
        break
      end
      node = node.next_node
      index += 1
    end
    return index if contains

    nil
  end

  def to_s
    node = @head
    until node.nil?
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    puts 'nil'
  end

  def insert_at(value, index)
    index = @size - index.abs if index.negative?

    return nil if index > @size

    new_node = Node.new(value)
    if index.zero?
      new_node.next_node = @head
      @head = new_node
      @tail = new_node
      @size += 1
      return new_node
    end

    if index == @size
      @tail.next_node = new_node
      @tail = new_node
      @size += 1
      return new_node
    end

    current_index = 0
    node = @head
    while current_index < index - 1
      current_index += 1
      node = node.next_node
    end
    @size += 1
    new_node.next_node = node.next_node
    node.next_node = new_node
  end

  def remove_at(index)
    index = @size - index.abs if index.negative?

    return nil if index >= @size

    if index.zero?
      node = @head
      @head = @head.next_node
      @tail = nil if @head.nil?
      @size -= 1
      return node.value
    end

    current_index = 0
    current_node = @head
    while current_index < index - 1
      current_index += 1
      current_node = current_node.next_node
    end
    @size -= 1
    node = current_node.next_node
    current_node.next_node = node.next_node
    node.value
  end
end
