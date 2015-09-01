require 'pry'

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(value)
    @head = Node.new(value, nil)
  end

  def add_to_end(value)
    current = @head

    while current.next_node != nil 
      current = current.next_node
    end

    current.next_node = Node.new(value, nil)
  end

  def add_to_beginning(value)
    @head = Node.new(value, @head)
  end

  def delete(value)
    current = @head
    if current.value == value
      @head = @head.next_node
    else
      while current != nil and current.next_node != nil and current.next_node.value != value
        current = current.next_node
      end

      if (current != nil) && (current.next_node != nil)
        current.next_node = current.next_node.next_node
      end
    end
  end

  def display
    current = @head
    full_list = []
    
    while current != nil and current.next_node != nil
      full_list += [current.value.to_s]
      current = current.next_node
    end

    full_list += [current.value.to_s]
    p full_list.join("=>")
  end

  def reverse
    return if @head.next_node.nil?

    current = @head.next_node
    right = current.next_node
    left = @head
    @head.next_node = nil

    while current != nil
      current.next_node = left
      left = current
      current = right
      right = right.next_node unless right.nil?
    end

    @head = left
  end
end

if __FILE__ == $0
  l = LinkedList.new(10)
  
  l.add_to_end(20)
  l.add_to_end(30)
  l.add_to_end(100)
  l.add_to_end(40)
  l.display

  l.delete(100)
  l.display

  l.add_to_beginning(0)
  l.display

  l.reverse
  l.display
end
