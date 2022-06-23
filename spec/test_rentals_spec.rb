require_relative '../rental'

describe Rental do
  let(:rentals) { Rental.new('Clean code', 'ismail', '12/09/22') }

  describe 'Test creating new rentals' do
    it 'test retriving rentals name' do
      expect(rentals.book).to eq('Clean code')
    end
    it 'test retriving rentals book title' do
      expect(rentals.person).to eq('ismail')
    end
    it 'test retriving rentals date' do
      expect(rentals.date).to eq('12/09/22')
    end
  end
end
