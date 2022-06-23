module SaveToFile
  def write_to_file
    books = {}
    people = {}
    rentals = {}
    @books.each { |book| books[book.class] = { 'title' => book.title, 'author' => book.author } }
    @people.each do |person|
      people[person.class] = if person.instance_of?(Teacher)
                               { 'name' => person.name, 'specialization' => person.specialization, 'age' => person.age,
                                 'parent_permission' => person.parent_permission, 'id' => person.id }
                             else
                               { 'name' => person.name, 'age' => person.age,
                                 'parent_permission' => person.parent_permission, 'id' => person.id }

                             end
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
      books.each { |_book, prop| @books.push(Book.new(prop['title'], prop['author'])) }
    end
    return unless File.exist?('./data/people.json')

    people = File.read('./data/people.json')
    people = JSON.parse(people)
    people.each do |_person, prop|
      if prop['specialization']
        @people.push(Teacher.new(prop['specialization'], prop['name'], prop['age']))
      else
        @people.push(Student.new(prop['age'], prop['name'], prop['parent_permission']))
      end
    end
  end
end
