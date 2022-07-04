public

def write_to_file
  books = []
  people = []
  rentals = []
  @books.each do |book|
    b = {
      'title' => book.title,
      'author' => book.author
    }
    books.push(b)
  end

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

  @rentals.each do |rental|
    r = [
      book: { 'title' => rental.book.title, 'author' => rental.book.author },
      person: { 'name' => rental.person.name, 'age' => rental.person.age, 'id' => rental.person.id },
      date: { 'date' => rental.date }
    ]
    rentals.push(r)
  end
  File.write('./data/books.json', JSON.generate(books), mode: 'w')
  File.write('./data/people.json', JSON.generate(people), mode: 'w')
  File.write('./data/rentals.json', JSON.generate(rentals), mode: 'w')
  exit
end

def read_from_file
  if File.exist?('./data/books.json')
    books = File.read('./data/books.json')
    books = JSON.parse(books)
    books.each { |prop| @books.push(Book.new(prop['title'], prop['author'])) }
  end

  return unless File.exist?('./data/people.json')

  people = File.read('./data/people.json')
  people = JSON.parse(people)
  people.each do |prop|
    if prop['specialization']
      @people.push(Teacher.new(prop['specialization'], prop['name'], prop['age']))
    else
      @people.push(Student.new(prop['name'], prop['age'], prop['parent_permission']))
    end
  end

  return unless File.exist?('./data/rentals.json')

  rentals = File.read('./data/rentals.json')
  rentals = JSON.parse(rentals)
  rentals.each_with_index do |rental, i|
    b = Book.new(rental[i]['book']['title'], rental[i]['book']['author'])
    pr = Person.new(rental[i]['person']['age'], rental[i]['person']['name'])
    pr.id = rental[i]['person']['id']
    date = rental[i]['date']['date']
    @rentals.push(Rental.new(b, pr, date))
  end
end
