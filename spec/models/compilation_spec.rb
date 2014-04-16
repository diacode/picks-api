require 'spec_helper'

describe Compilation do
  describe '#generate_installment' do
    context 'There is no previous compilation registered' do
      it 'should be the first installment' do
        compilation = Compilation.new
        compilation.generate_installment 

        expect(compilation.installment).to eq(1)
      end
    end

    context 'There is a previous compilation registered' do
      let(:previous_compilation){ FactoryGirl.create(:compilation) }

      it 'should be the second installment' do
        compilation = Compilation.new
        compilation.generate_installment 

        expect(compilation.installment).to eq(2)
      end
    end
  end
end
