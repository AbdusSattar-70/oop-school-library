require_relative 'modules/create_person'
require_relative 'modules/create_book'
require_relative 'modules/create_rental'
require_relative 'modules/list_all_books'
require_relative 'modules/list_all_people'
require_relative 'modules/list_all_rentals'

class App
  include CreatePerson
  include CreateBook
  include CreateRental
  include ListAllBooks
  include ListAllPeople
  include ListAllRentals
  def initialize
    @books = []
    @people = []
  end
end
