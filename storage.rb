module Storage
  def save_data
    save_books
    save_people
    save_rentals
  end

  def save_books
    file_path = File.join('data', 'books.json')
    File.write(file_path, JSON.generate(books.map(&:to_h)))
  rescue StandardError => e
    puts "An error occurred while saving books: #{e.message}"
  end

  def save_people
    file_path = File.join('data', 'people.json')
    people_data = @people.map do |person|
      next if person.id.nil? # Skip saving person if ID is nil

      if person.is_a?(Student)
        person.to_h.merge('type' => 'student')
      elsif person.is_a?(Teacher)
        person.to_h.merge('type' => 'teacher', 'parent_permission' => person.parent_permission)
      end
    end.compact
    File.write(file_path, JSON.generate(people_data))
  rescue StandardError => e
    puts "An error occurred while saving people: #{e.message}"
  end

  def save_rentals
    file_path = File.join('data', 'rentals.json')
    File.write(file_path, JSON.generate(rentals.map(&:to_h)))
  rescue StandardError => e
    puts "An error occurred while saving rentals: #{e.message}"
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    file_path = File.join('data', 'books.json')
    if File.exist?(file_path)
      json = File.read(file_path)
      @books = JSON.parse(json).map { |data| Book.new(data['title'], data['author']) }
    else
      @books = []
    end
  rescue StandardError => e
    puts "An error occurred while loading books: #{e.message}"
  end

  def load_people
    file_path = File.join('data', 'people.json')
    if File.exist?(file_path)
      json = File.read(file_path)
      @people = JSON.parse(json).map do |data|
        if data['classroom']
          Student.new(data['age'], data['classroom'], data['name'], parent_permission: data['parent_permission'])
        else
          Teacher.new(data['age'], data['specialization'], data['name'], parent_permission: data['parent_permission'])
        end
      end
    else
      @people = []
    end
  rescue StandardError => e
    puts "An error occurred while loading people: #{e.message}"
  end

  def load_rentals
    file_path = File.join('data', 'rentals.json')
    if File.exist?(file_path)
      json = File.read(file_path)
      @rentals = parse_rentals(json)
    else
      @rentals = []
    end
  rescue StandardError => e
    puts "An error occurred while loading rentals: #{e.message}"
  end

  def parse_rentals(json)
    JSON.parse(json).map { |data| create_rental(data) }.compact
  end

  def create_rental(data)
    book = find_book(data['book']['title'], data['book']['author'])
    person = find_person(data['person']['id'])
    Rental.new(data['date'], book, person) if book && person
  end

  def find_book(title, author)
    books.find { |book| book.title == title && book.author == author }
  end

  def find_person(id)
    people.find { |person| person.id == id }
  end
end
