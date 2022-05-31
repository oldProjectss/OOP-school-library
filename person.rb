# code start here
class Nameable
  def correct_name
    raise NotImplementedError, 'You must implement this method'
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  attr_accessor :nameable

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length > 10
    super.each_char.first(10).join
    else
    super
    end
  end
end

# Create Person class with constructor using parameters => name, age, and parent_permission
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
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

  # I renamed this method so it pass the linters check
  def of_age?
    @age >= 18
  end

  # Create Private method
  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  puts capitalizedTrimmedPerson.correct_name