require_relative 'classroom'

class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_h
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom,
      'rentals' => @rentals.map(&:to_h) # Convert rentals to hash
    }
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
