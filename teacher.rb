class Teacher < Person
  attr_accessor :classroom, :specialization, :parent_permission

  def initialize(age, specialization, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, id: id)
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end
