require_relative '../decorat'
require_relative '../person'
person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new('')
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name

describe BaseDecorator do

    #base = BaseDecorator.new
    base= BaseDecorator.new('the book of boba fet')
    it 'test decorators' do
        # expect(base.correct_name).to eql("the book of boba fet")
        cap = CapitalizeDecorator.new('the book of boba fet')
        expect(cap.correct_name).to eql("THE BOOK OF BOOBA FET")
        tri = TrimmerDecorator.new
        expect(tri.correct_name).to eql('the book ')
    end
end