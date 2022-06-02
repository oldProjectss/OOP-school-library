=begin
    List all books.
    List all people.
    Create a person (teacher or student, not a plain Person).
    Create a book.
    Create a rental.
    List all rentals for a given person id.
=end

require './book'
require './person'
require './people'

def create_book
    puts "Enter book title:"
    title = gets.chomp
    puts "Enter book author:"
    author = gets.chomp
    Book.new(title, author)
end

def create_person
    puts "Enter person name:"
    name = gets.chomp
    puts "Enter person type (teacher/student):"
    type = gets.chomp
    Person.new(name, type)
end

def create_rental
    puts "Enter person id:"
    person_id = gets.chomp
    puts "Enter book id:"
    book_id = gets.chomp
    puts "Enter rental date:"
    date = gets.chomp
    Rental.new(person_id, book_id, date)
end

def list_books
    Book.all.each do |book|
        puts "Book: #{book.title} by #{book.author}"
    end
end

def list_people
    Person.all.each do |person|
        puts "Person: #{person.name} (#{person.type})"
    end
end

def list_rentals(person_id)
    Rental.all.each do |rental|
        if rental.person_id == person_id
            puts "Rental: #{rental.book_id} for #{rental.person_id} on #{rental.date}"
        end
    end
end