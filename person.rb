# Create Person class with constructor using parameters => name, age, and parent_permission
class Person
  def initialize(name, age = 'Unknown', parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Create getters for "id", "name", and "age" & Create setters for "name", and "age"
  attr_accessor :name, :age
  attr_reader :id

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
