require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, id, age, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
