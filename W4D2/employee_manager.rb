

class Employee
  attr_reader :salary 

  def initialize(name,title,salary,boss)
    @name = name
    @title = title 
    @salary = salary
    @boss = boss 
  
  end 

    def bonus(multiplier)
      @bonus = salary * multiplier
    end 

end 

class Manager < Employee 

  def initialize(name,title,salary,boss,employees=[])
    super(name,title,salary,boss)
    @employees = employees
  end 

  def bonus(multiplier)
    sum = 0 
    @employees.each {|el| sum += el.salary}
    @bonus = sum * multiplier
  
  end 
end 



shawna = Employee.new("Shawna", "TA", 12000, "Darren")
# p shawna 
david = Employee.new("David", "TA", 10000, "Darren")
# p david 

darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [shawna, david])
# p darren 
ned = Manager.new("Ned", "Founder", 1000000, nil,[darren,shawna,david])
# p ned 

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
