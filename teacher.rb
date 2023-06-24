require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, id, age, name = 'unknown', parent_permission: true)
    super(id, name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
