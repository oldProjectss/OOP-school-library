#     List all books.
#     List all people.
#     Create a person (teacher or student, not a plain Person).
#     Create a book.
#     Create a rental.
#     List all rentals for a given person id.

require './book'
require './person'
require './rental'
require './classroom'
require './student'
require './teacher'
require './rentals_handler'
require './person_handler'
require './book_handler'

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  include PersonModule
  include Rentals
  include BookModule

  def list_books
    @books.each_with_index { |book, index| puts "#{index + 1}) Title: \"#{book.title}\", Author: #{book.author}" }
    puts
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts
  end

  def list_rentals
    puts 'Enter person id:'
    list_people
    person_id = gets.chomp
    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author} rented by #{rental.person.name}"
      end
    end
    puts
  end
end
