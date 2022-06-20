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

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end
  include Rentals
  # is teacher or student
  def teacher_or_student(type)
    case type
    when '1'
      print 'Specialisation:  '
      gets.chomp
    when '2'
      loop do
        print 'Has parent permission [y/n]:'
        case gets.chomp
        when 'y'
          return true
        when 'n'
          return false
        else
          puts 'Invalid person parent permission. Please try again.'
        end
      end
    end
  end

  # Create a person (teacher or student, not a plain Person).
  def create_person
    type = ''
    loop do
      puts 'Do you want to create a teacher (1) or a student (2)? [Input 1 or 2]:'
      type = gets.chomp
      break if %w[1 2].include?(type)
    end
    age = ''
    loop do
      print 'Age:  '
      age = gets.chomp
      break if age.to_i.positive? && age.to_i < 100 && age.to_i.to_s == age
    end
    print 'Name:  '
    name = gets.chomp
    specialisation, parent_permission = teacher_or_student(type)

    case type
    when '1'
      new_person = Teacher.new(specialisation, name, age)
    when '2'
      new_person = Student.new(age, name, parent_permission)
    end
    @people.push(new_person)
    puts
    # Puts message when person is created successfully
    puts "Person #{new_person.name} created successfully."
    puts
  end

  # Create a book.
  def create_book
    print 'Title:  '
    title = gets.chomp
    print 'Author:  '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts
    # Puts message when book is created successfully
    puts "Book #{new_book.title} created successfully."
    puts
    puts
  end



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
