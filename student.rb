include './person.rb'

class Student < Person
  def initialize(classroom)
    @classroom = classroom
    super(name, age, _parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
