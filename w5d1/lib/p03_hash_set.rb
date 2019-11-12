class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = 0 
    self.flatten.each_with_index {|el, i| hash += el ** i}
    hash 
  end
end

class String
  def hash
    hash = 0 
    alph = ("a".."z").to_a

    self.each_char.with_index {|el, i| hash += alph.index(el).to_i ** i}
    hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alph = ("a".."z").to_a
    hash = 0 
    self.each do |k,v|
      hash += (alph.index(k.to_s).to_i ** alph.index(v).to_i) + (alph.index(v).to_i ** alph.index(k.to_s).to_i)
    end 
    hash 

  end
end

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
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

  def insert(key)
    num = key.hash
    if @count >= @store.length 
      resize!
    end 
    if !@store[num % @store.length].include?(num) 
      @count += 1
      @store[num % @store.length] << num 
    
    end   
   
  end

  def include?(key)
    return false if key[0].is_a? Array
    num = key.hash
    @store.flatten.include?(num)
  end
  
  def remove(key)
    num = key.hash
    if self.include?(key)
      @count -= 1
      @store.each do |sub|
        if sub.include?(num)
          sub.delete(num)
        end 
      end
    end
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
