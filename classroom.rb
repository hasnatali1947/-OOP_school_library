require_relative 'students'

class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @students = []
  end

  def add_students(student)
    @students << student
    student.classroom = self
  end
end
