module Rentals
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
end