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

  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
  end

  def create_person
    puts 'Enter person name:'
    name = gets.chomp
    puts 'Enter person type (teacher/student):'
    type = gets.chomp
    new_person = Person.new(name, type)
    @people.push(new_person)
  end

  def create_rental
    puts 'Enter person id:'
    person_id = gets.chomp
    puts 'Enter book id:'
    book_id = gets.chomp
    puts 'Enter rental date:'
    date = gets.chomp
    new_rental = Rental.new(book_id, person_id, date)
    @rentals.push(new_rental)
  end

  def list_books
    @books.each do |book|
      puts book.title
    end
  end

  def list_people
    @people.each do |person|
      puts person.name
    end
  end

  def list_rentals
    puts 'Enter person id:'
    person_id = gets.chomp
    @rentals.each do |rental|
      puts rental.book_id if rental.person_id == person_id
    end
  end
end

app = App.new
# app.create_book()
# app.create_person()
# app.create_rental()
# app.list_books()
app.list_people()
# list_rentals(1)
# list_rentals(2)
