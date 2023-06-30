require_relative '../nameable'
require_relative '../base_decorator'

describe TrimmerDecorator do
  let(:nameable) { instance_double('Nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    context 'when the name length is greater than 10 characters' do
      it 'should return the trimmed name with ellipsis' do
        allow(nameable).to receive(:correct_name).and_return('Christopher Nolan')
        expect(decorator.correct_name).to eq('Christophe...')
      end
    end
  end
end
