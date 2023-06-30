require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  let(:book) { Book.new('CS', 'Naji') }
  let(:person) { Person.new(23, name: 'Ali', parent_permission: true) }

  context 'when initializing' do
    it 'should have a title' do
      expect(book.title).to eq 'CS'
    end

    it 'should have an author' do
      expect(book.author).to eq 'Naji'
    end

    it 'should have an empty rentals list' do
      expect(book.rentals).to be_empty
    end

    it 'should convert to hash format' do
      hash = {
        'title' => 'CS',
        'author' => 'Naji',
        'rentals' => []
      }
      expect(book.to_h).to eql(hash)
    end
  end
end
