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
  include SaveToFile
  case option
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  when 7
    app.write_to_file
  end
end

def self.import_save_module
  include SaveToFile
end

def input
  import_save_module
  app = App.new
  option = ''
  app.read_from_file
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
