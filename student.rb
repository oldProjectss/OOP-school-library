require './person'
require './classroom'

class Student < Person
  attr_accessor :name, :age

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(name, age, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
