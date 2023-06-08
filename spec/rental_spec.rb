require_relative '../classes/rental'
require_relative '../classes/person'
require_relative '../classes/book'

describe Rental do
  before :each do
    @person = Person.new(19, 'Humayun', true)
    @book = Book.new('Pachali', 'Sattar')
    @book_title = @book.title
    @person_id = @person.id

    @rental = Rental.new('12-12-12', @person, @book)
  end
  it '#new or instance of Rental' do
    expect(@rental).to be_instance_of Rental
  end
  it 'has person_id and book_title' do
    expect(@rental.person.id).to eq(@person_id)
    expect(@rental.book.title).to eq(@book_title)
  end
end
