require_relative '../teacher.rb'
require_relative '../person.rb'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(35, 'Mathematics', 'John Doe') }

  describe '#initialize' do
    it 'should have age' do
      expect(teacher.age).to eq(35)
    end

    it 'should have specialization' do
      expect(teacher.specialization).to eq('Mathematics')
    end

    it 'should have name' do
      expect(teacher.name).to eq('John Doe')
    end

    it 'should have parent permission' do
      expect(teacher.parent_permission).to eq(true)
    end

    it 'should have an ID' do
      expect(teacher.id).not_to be_nil
    end
  end

  describe '#can_use_services?' do
    it 'should return true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
