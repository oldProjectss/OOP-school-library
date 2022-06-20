module BookModule
  # Create a book.
  def create_book
    print 'Title:  '
    title = gets.chomp
    print 'Author:  '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts
    # Puts message when book is created successfully
    puts "Book #{new_book.title} created successfully."
    puts
    puts
  end
end