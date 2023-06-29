require_relative '../person'
require_relative '../book'
require_relative '../rental'

RSpec.describe Person do
  context 'when initializing' do
    before(:each) do
      @person = Person.new(17, 'Milli')
    end

    it 'should have a non-nil id' do
      expect(@person.id).not_to be_nil
    end

    it 'should have an age' do
      expect(@person.age).to eq(17)
    end

    it 'should have a name' do
      expect(@person.name).to eq('Milli')
    end

    it 'should have parent_permission set to true' do
      expect(@person.instance_variable_get(:@parent_permission)).to be_truthy
    end

    it 'should have an empty rentals array' do
      expect(@person.rentals).to be_empty
    end
  end

  context 'when testing methods' do
    let(:person) { Person.new(17, 'Milli') }

    it 'should return the correct name' do
      expect(person.correct_name).to eq('Milli')
    end

    it 'should convert to a hash' do
      hash = {
        'id' => person.id,
        'name' => 'Milli',
        'age' => 17,
        'parent_permission' => true,
        'rentals' => []
      }
      expect(person.to_h).to eq(hash)
    end

    context 'when testing can_use_services?' do
      it 'should be able to use services' do
        expect(person.can_use_services?).to be_truthy
      end
    end
  end

  context 'when adding a rental' do
    let(:book) { Book.new('CS', 'Grace') }
    let(:person) { Person.new(17, 'Milli', parent_permission: false) }
    let(:rental) { Rental.new('2023-02-22', book, person) }

    before(:each) do
      person.add_rentals(book, '2023-02-22')
    end

    it 'should have rental data' do
      expect(person.rentals).not_to be_empty
    end

    it 'should have the correct rental' do
      expect(person.rentals[0].date).to eq('2023-02-22')
      expect(person.rentals[0].book).to eq(book)
      expect(person.rentals[0].person).to eq(person)
    end
  end
end
