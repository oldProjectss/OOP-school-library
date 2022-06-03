require './app'

def main
  app = App.new

  options = ['list all books', 'list all people', 'Create a person', 'Create a book', 'Create a rental',
             'List all rentals for a given person id', 'Exit']

  def display_options(option_list)
    puts 'Please choose an option by entering a number:'
    option_list.each_with_index do |element, index|
      puts "#{index + 1} - #{element}"
    end
  end

  loop do
    display_options(options)
    option = gets.chomp.to_i
    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    when 7
      break
    else
      puts 'Invalid input. Please try again.'
    end
  end
end
main
