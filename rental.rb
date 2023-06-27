class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end

  attr_accessor :date
  attr_reader :book, :person

  def to_h
    {
      'date' => @date,
      'book' => {
        'title' => @book.title,
        'author' => @book.author
      },
      'person' => {
        'id' => @person.id,
        'name' => @person.name,
        'age' => @person.age,
        'parent_permission' => @person.parent_permission
      }
    }
  end
end
