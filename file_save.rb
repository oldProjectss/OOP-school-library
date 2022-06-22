module SaveToFile
  def write_to_file
    books = {}
    @books.each { |book| books[book.title] = book.author }
    File.write('./data/books.json', JSON.generate(books), mode: 'a')
    exit
  end

  def read_from_file
    if File.exist?('./data/books.json')
      books = File.read('./data/books.json')
      books = JSON.parse(books)
      books.each { |title, author| @books.push(Book.new(title, author)) }
    end
  end
end
