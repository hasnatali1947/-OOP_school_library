require_relative '../person'
require_relative '../students.rb'
require_relative '../classroom'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Science') }
  let(:student) { Student.new(16, classroom, 'John Doe') }

  describe '#initialize' do
    it 'should have age' do
      expect(student.age).to eq(16)
    end

    it 'should have name' do
      expect(student.name).to eq('John Doe')
    end

    it 'should have parent_permission' do
      expect(student.parent_permission).to eq(true)
    end

    it 'should have a classroom' do
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#play_hooky' do
    it 'should return the hooky message' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#to_h' do
    it 'should return the student details as a hash' do
      expected_hash = {
        'id' => student.id,
        'name' => 'John Doe',
        'age' => 16,
        'parent_permission' => true,
        'classroom' => classroom,
        'rentals' => []
      }
      expect(student.to_h).to eq(expected_hash)
    end
  end

  
end
