module SaveToFile
  def write_to_file
    books = {}
    @books.each { |book| books[book.title] = book.author}
    File.write('./data/books.json', JSON.generate(books), mode='a')
  end