module SaveToFile
  def write_to_file
    books = {}
    rentals={}
    @books.each { |book| books[book.title] = book.author }
    @rentals.each { |rental| rentals[rental.book.title] = {'date' => rental.date, 'person' => rental.person.name }}
    File.write('./data/books.json', JSON.generate(books), mode: 'a')
    File.write('./data/rentals.json', JSON.generate(rentals), mode: 'a')
    exit
  end

  def read_from_file
    if File.exist?('./data/books.json')
      books = File.read('./data/books.json')
      books = JSON.parse(books)
      books.each { |title, author| @books.push(Book.new(title, author)) }
    end
    if File.exist?('./data/rentals.json')
      rentals = File.read('./data/rentals.json')
      rentals = JSON.parse(rentals)
      rentals.each {|book, person| @rentals.push(Rental.new(book, person["person"],person["date"]))}
    end
  end
end
