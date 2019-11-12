class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = 0 
    self.each_with_index {|el, i| hash += el ** i}
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
