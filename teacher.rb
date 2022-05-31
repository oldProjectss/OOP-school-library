require './person'

class Teacher < Person
  def initialize(specialization, name, age = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(name, age, parent_permission)
  end

  def can_use_services?
    true
  end
end

t = Teacher.new('math', 'Jack', 20, true)
puts t
