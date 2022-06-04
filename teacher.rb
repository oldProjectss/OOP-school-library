require './person'

class Teacher < Person
  attr_accessor :specialization, :age, :name, :parent_permission

  def initialize(specialization, age, name = 'Unknown')
    @specialization = specialization
    super(name, age, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
