class Person
    attr_reader :id, :parent_permission
    attr_accessor :name, :age
  
    def initialize(id, age, name = "unknown", parent_permission = true)
      @id = id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end

    def can_use_services?
        return @age >= 18 || @parent_permission
      end
      
private

def of_age?
    return true if @age >= 18 
    false
end
end

  p1 = Person.new(1, 23, "Arsalan")
  puts "Person ID: #{p1.id}"
  puts "Name: #{p1.name}"
  puts "Age: #{p1.age}"

  p1.name = "Hasnat"
  p1.age = 25

  puts "update name #{p1.name}"
  puts "update age #{p1.age}"