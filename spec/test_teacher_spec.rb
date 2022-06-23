require_relative '../teacher'

describe Teacher do
  random_age = rand(18..60)
  let(:teacher) { Teacher.new('Tech', 'ismail', random_age) }

  describe 'Test creating new teacher' do
    it 'test retriving teacher name' do
      expect(teacher.name).to eq('ismail')
    end
    it 'test retriving teacher specialization' do
      expect(teacher.specialization).to eq('Tech')
    end
    it 'test retriving teacher age' do
      expect(teacher.age).to eq(random_age)
    end
  end

  describe 'Test teacher methods' do
    it 'tests can_use_services? method' do
      expect(teacher.can_use_services?).to eq(true)
    end
    it 'tests correct_name method' do
      expect(teacher.correct_name).to eq('ismail')
    end
  end
end
