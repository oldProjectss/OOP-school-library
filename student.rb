require './person'

class Student < Person
  def initialize(classroom, name, age = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(name, age, parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
