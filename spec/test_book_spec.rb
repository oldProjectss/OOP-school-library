require_relative '../book'
require_relative '../file_save'
describe Book do
  let(:book) { Book.new('The High Republic: Quest for Planet X', 'Tessa Gratton') }

  describe '#title' do
    it 'returns the title' do
      expect(book.title).to eq('The High Republic: Quest for Planet X')
    end
  end

  describe '#author' do
    it 'returns the author' do
      expect(book.author).to eq('Tessa Gratton')
    end
  end
end
