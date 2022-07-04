public

def save_books
  books = []

  @books.each do |book|
    b = {
      'title' => book.title,
      'author' => book.author
    }
    books.push(b)
  end

  File.write('./data/books.json', JSON.generate(books), mode: 'w')
end

def save_people
  people = []

  @people.each do |person|
    p = if person.instance_of?(Teacher)
          { 'name' => person.name, 'specialization' => person.specialization, 'age' => person.age,
            'parent_permission' => person.parent_permission, 'id' => person.id }
        else
          { 'name' => person.name, 'age' => person.age,
            'parent_permission' => person.parent_permission, 'id' => person.id }

        end
    people.push(p)
  end

  File.write('./data/people.json', JSON.generate(people), mode: 'w')
end

def save_rentals
  rentals = []

  @rentals.each do |rental|
    r = {
      'book' => { 'title' => rental.book.title, 'author' => rental.book.author },
      'person' => { 'name' => rental.person.name, 'age' => rental.person.age, 'id' => rental.person.id },
      'date' => rental.date
    }
    rentals.push(r)
  end

  File.write('./data/rentals.json', JSON.generate(rentals), mode: 'w')
end

def read_book_data
  return unless File.exist?('./data/books.json')

  books = JSON.parse(File.read('./data/books.json'))
  books.each do |book|
    @books.push(Book.new(book['title'], book['author']))
  end
end

def read_person_data
  return unless File.exist?('./data/people.json')

  people = JSON.parse(File.read('./data/people.json'))
  people.each do |person|
    if person['specialization']
      @people.push(Teacher.new(person['specialization'], person['name'], person['age']))
    else
      @people.push(Student.new(person['name'], person['age']))
    end
  end
end

def read_rental_data
  return unless File.exist?('./data/rentals.json')

  rentals = JSON.parse(File.read('./data/rentals.json'))
  rentals.each do |rental|
    b = Book.new(rental['book']['title'], rental['book']['author'])
    pr = Person.new(rental['person']['age'], rental['person']['name'])
    pr.id = rental['person']['id']
    date = rental['date']
    @rentals.push(Rental.new(b, pr, date))
  end
end

# def read_from_file
#   if File.exist?('./data/books.json')
#     books = File.read('./data/books.json')
#     books = JSON.parse(books)
#     books.each { |prop| @books.push(Book.new(prop['title'], prop['author'])) }
#   end

#   return unless File.exist?('./data/people.json')

#   people = File.read('./data/people.json')
#   people = JSON.parse(people)
#   people.each do |prop|
#     if prop['specialization']
#       @people.push(Teacher.new(prop['specialization'], prop['name'], prop['age']))
#     else
#       @people.push(Student.new(prop['name'], prop['age'], prop['parent_permission']))
#     end
#   end

#   return unless File.exist?('./data/rentals.json')

#   rentals = File.read('./data/rentals.json')
#   rentals = JSON.parse(rentals)
#   rentals.each do |rental|
#     b = Book.new(rental['book']['title'], rental['book']['author'])
#     pr = Person.new(rental['person']['age'], rental['person']['name'])
#     pr.id = rental['person']['id']
#     date = rental['date']
#     @rentals.push(Rental.new(b, pr, date))
#   end
# end
