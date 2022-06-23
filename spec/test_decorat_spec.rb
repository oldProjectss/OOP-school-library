require_relative '../decorat'
require_relative '../person'

describe BaseDecorator do
  person = Person.new(25, 'maximilianus')
  it 'teats base decorator' do
    expect(person.correct_name).to eql('maximilianus')
  end
  it 'tests the capitalization decorator' do
    capitalized_person = CapitalizeDecorator.new(person)
    expect(capitalized_person.correct_name).to eql('Maximilianus')
  end
  it 'tests the trimmed decorator' do
    trimmed_person = TrimmerDecorator.new(person)
    expect(trimmed_person.correct_name).to eql('maximilian')
  end
end
