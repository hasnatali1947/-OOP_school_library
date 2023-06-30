require_relative '../nameable'
require_relative '../base_decorator'


describe TrimmerDecorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    context 'when the name length is greater than 10 characters' do
      before(:each) do
        allow(nameable).to receive(:correct_name).and_return('Christopher')
      end

      it 'should return the trimmed name with ellipsis' do
        expect(decorator.correct_name).to eq('Christophe...')
      end
    end
  end
end
