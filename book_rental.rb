class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end
end

class Rental
  attr_accessor :book, :person, :date

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
  end
end
