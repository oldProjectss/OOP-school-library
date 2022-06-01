class Rental
  attr_accessor :book, :person, :date

  def initialize(book, person, date)
    @book = book
    book.rental << self

    @person = person
    person.rental << self

    @date = date
  end
end
