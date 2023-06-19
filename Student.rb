require "./person.rb"

class Student < Person
    attr_accessor :classroom
    def initialize(id, age, name = "unknown", parent_permission = true, classroom)
        super(id, age, name, parent_permission)
        @classroom = classroom
    end

    def play_hooky
        return "¯\(ツ)/¯"
    end
end

p1 = Student.new(1, 18, "John", true, "Math")

puts p1.id     
puts p1.age            
puts p1.name           
puts p1.parent_permission       
puts p1.play_hooky   