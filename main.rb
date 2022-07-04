require './app'
require './file_save'
require 'json'

def menu_items
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given id'
  puts '7 - Exit'
end

def self.part_one(app, option)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  end
end

def self.part_two(app, option)
  case option
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  when 7
    app.save_books
    app.save_people
    app.save_rentals
    exit()
  end
end

def input
  app = App.new
  option = ''
  app.read_book_data
  app.read_person_data
  app.read_rental_data
  loop do
    menu_items
    option = gets.chomp.to_i
    part_one(app, option)
    part_two(app, option)
  end
end

def main
  input
end
main
