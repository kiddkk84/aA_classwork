class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev 
  end

  def empty?
    first == @tail && last == @head 
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    if self.empty?
      new = Node.new(key, val)
      new.next = @tail 
      new.prev = @head 
      @head.next = new  
      @tail.prev = new
      
    else  
      new = Node.new(key, val) 
      new.prev = @tail.prev 
      new.next = @tail  
      @tail.prev = new 
      
    end 
  end

  def update(key, val)
  end

  def remove(key)
  end
require "byebug"
  def each(&prc)
    node = @head.next 
    # arr = [] 
    # debugger 
    while node != @tail 
    
      prc.call(node)
      node = node.next 
    end 
    
    
  
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
