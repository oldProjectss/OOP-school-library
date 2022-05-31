# Create Person class with constructor using parameters => name, age, and parent_permission
class Person
  def initialize(name, age = 'Unknown', _parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
  end

  # Create getters for "id", "name", and "age"
  attr_reader :id
  attr_accessor :name, :age

  # Create setters for "name", and "age"

  # Create Private method
  private

  def is_of_age?
    @age >= 18
  end

  # Create Private method
  public

  def can_use_services?
    is_of_age? || @parent_permission
  end
end
