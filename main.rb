require './app'

def main
  app = App.new
  app.run

  # app.create_book()
  # app.create_person()
  # app.create_rental()
  # app.list_books()
  # app.list_people()
  # app.list_rentals(1)
  # app.list_rentals(2)
end

main
