# Create Person class with constructor using parameters => name, age, and parent_permission
class Person
  def initialize(name, age="Unknown", parent_permission=true)
    @id
    @name = name
    @age = age
  end

  # Create getters for "id", "name", and "age"
  attr_reader :id
  attr_reader :name
  attr_reader :age

  # Create setters for "name", and "age"
  attr_writer :name
  attr_writer :age

  # Create Private method
  private

  def is_of_age?
    @age >= 18 ? true : false
  end

  public

  def can_use_services?
    is_of_age? || parent_permission ? true : false
  end
end