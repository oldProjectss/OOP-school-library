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

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  # Create a person (teacher or student, not a plain Person).
  def create_person
    puts 'Do you want to create a teacher (1) or a student (2)? [Input 1 or 2]:'
    type = gets.chomp
    puts 'Invalid input. Please try again.' if type != '1' || type != '2'

    print 'Age:  '
    age = gets.chomp
    print 'Name:  '
    name = gets.chomp

    # if teacher add specialisation
    if type == '1'
      print 'Specialisation:  '
      specialisation = gets.chomp
    end

    # Student permission is true
    if type == '2'
      print 'Has parent permission [Y/N]:'
      case gets.chomp
      when 'Y'
        parent_permission = true
      when 'N'
        parent_permission = false
      else
        puts 'Invalid person parent permission. Please try again.'
      end
    end

    # Create a teacher or a student
    case type
    when '1'
      new_person = Teacher.new(specialisation, age, name)
    when '2'
      new_person = Student.new(age, name, parent_permission)
    end
    @people.push(new_person)
    puts
    # Puts message when person is created successfully
    puts "Person #{new_person.name} created successfully."
    puts
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

  def create_rental
    puts 'Select a book from the following list by number:'
    list_books
    book_id = gets.chomp
    book = @books[book_id.to_i - 1]
    puts 'Select a person from the following list by number:'
    list_people
    person_id = gets.chomp
    person = @people[person_id.to_i - 1]
    print 'Date:  '
    date = gets.chomp
    new_rental = Rental.new(book, person, date)
    new_rental.person.id = person_id
    @rentals.push(new_rental)
    puts
    puts "Rental for #{new_rental.person.id} created successfully."
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
