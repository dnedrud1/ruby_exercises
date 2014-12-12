require_relative '../caesar_cipher'

describe Caesar do

  let(:caesar) { Caesar.new }
  
  describe '#new' do
    it 'returns a Caesar object' do
      expect(caesar.class).to eql Caesar
    end
  end
  
  describe 'different possible inputs' do
    it 'returns correctly for all text' do
      expect(caesar.cipher('ABCDE',3)).to eql 'DEFGH'
    end
    it 'returns correctly for no text' do
      expect(caesar.cipher('$%&()',3)).to eql '$%&()'
    end
    it 'returns correctly for mix of text and symbols' do
      expect(caesar.cipher('Hello Dolly!!!',15)).to eql 'Wtaad Sdaan!!!'
    end
    it 'returns correctly for very large numbers' do
      expect(caesar.cipher('Hello Dolly!!!',2000)).to eql 'Fcjjm Bmjjw!!!'
    end
    it 'returns correctly for negative numbers' do
      expect(caesar.cipher('Hello Dolly!!!',-9)).to eql 'Yvccf Ufccp!!!'
    end
  end
  
end
