require_relative '../classroom'
describe Classroom do
    it 'Creates a new classroom correctly' do
        label = 'our classroom'
        classroom = Classroom.new(label)
        expect(classroom.students).to be_empty
        expect(classroom.label).to eql(label)
    end
end