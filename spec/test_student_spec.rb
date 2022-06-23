require_relative '../student'

describe Student do
  let(:student) { Student.new(true, 'david', 21) }

  describe 'Test creating new student' do
    it 'test retriving student name' do
      expect(student.name).to eq('david')
    end
    it 'test retriving student permissions' do
      expect(student.parent_permission).to eq(true)
    end
    it 'test retriving student age' do
      expect(student.age).to eq(21)
    end
  end

  describe 'Test student methods' do
    it 'tests the play_hooky method' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
