require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }

  describe '#initialize' do
    it 'should have a title' do
      expect(book.title).to eq('The Great Gatsby')
    end

    it 'should have an author' do
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'should have an empty list of rentals' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    let(:person) { double('Person') }
    let(:date) { Date.new(2023, 6, 30) }

    it 'should add a rental to the book' do
      rental = book.add_rental(person, date)
      expect(book.rentals).to include(rental)
    end

    it 'should return the added rental' do
      rental = book.add_rental(person, date)
      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end
  end

  describe '#to_h' do
    let(:rental) { double('Rental', to_h: { 'date' => Date.new(2023, 6, 30) }) }

    before do
      allow(rental).to receive(:book).and_return(book)
      book.rentals << rental
    end

    it 'should return a hash representation of the book' do
      expect(book.to_h).to eq({
        'title' => 'The Great Gatsby',
        'author' => 'F. Scott Fitzgerald',
        'rentals' => [
          { 'date' => Date.new(2023, 6, 30) }
        ]
      })
    end
  end
end
