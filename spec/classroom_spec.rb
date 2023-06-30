require_relative '../classroom'
require_relative '../students'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Math') }

  describe '#initialize' do
    it 'should have a label' do
      expect(classroom.label).to eq('Math')
    end

    it 'should have an empty list of students' do
      expect(classroom.students).to be_empty
    end
  end
end
