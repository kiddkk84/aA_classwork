class MaxIntSet
  attr_reader :store 
  def initialize(max)
    @max = max 
    @store = Array.new(max){false}
  end

  def insert(num)
    if num > 0 && num < @max 
      @store[num] = true  
    else 
      raise "Out of bounds"
    end 
  end

  def remove(num)
    @store[num] = false 
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store.each do |sub|
      if sub.include?(num)
        sub.delete(num)
      end
    end
  end

  def include?(num)
    # @store.any?{|sub| sub.include?(num)}
    @store.flatten.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def inspect 
    values = [] 
    @store.each do |sub|
      values += sub 
    end 
    return values 
  end 
    
  require 'byebug'
  def insert(num)
    
    if @count >= @store.length 
      resize!
    end 
    if !@store[num % @store.length].include?(num) 
      @count += 1
      @store[num % @store.length] << num 
    
    end   
   
  end

  def remove(num)
    if self.include?(num)
      @count -= 1
      @store.each do |sub|
        if sub.include?(num)
          sub.delete(num)
        end 
      end
    end
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    last = self.inspect 
    @store = Array.new(2*@count) {Array.new}
  
    last.flatten.each do |num|
      @store[num % @store.length] = [num] 
    end 

      


  end
end
