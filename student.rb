require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(name, age, parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
