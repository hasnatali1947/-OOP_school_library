require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true, id: nil)
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :rentals, :name, :age, :parent_permission, :id

  def can_use_services?
    return false unless @age && @parent_permission

    true
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental
    rental
  end

  def to_h
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'rentals' => @rentals.map(&:to_h) # Convert rentals to hash
    }
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
