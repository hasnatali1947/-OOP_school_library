class Person
  attr_reader :id, :parent_permission
  attr_accessor :name, :age

  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
