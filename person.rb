require './decorat'
require './rental'

# Create Person class with constructor using parameters => name, age, and parent_permission
class Person < Nameable

  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
    super()
  end

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

  def add_rental(book, date)
    Rental.new(book, self, date)
end
