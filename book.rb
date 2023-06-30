require_relative 'rental'


class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    # @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental
  end

  def to_h
    {
      # 'id' => @id,
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals.map(&:to_h)
    }
  end
end
