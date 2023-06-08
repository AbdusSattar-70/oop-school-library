require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new('Hello world', 'Sattar')
  end
  it 'should create an instance of Book class' do
    expect(@book).to be_instance_of Book
  end

  it 'check the attributes' do
    expect(@book).to have_attributes(title: 'Hello world', author: 'Sattar', rentals: [])
  end

  it '#add_rental check' do
    rental = double('Rental')
    allow(rental).to receive(:date) { '20-12-12' }
    allow(rental).to receive(:person_id) { '18' }
    allow(rental).to receive(:book_title) { 'Hello world' }
    @book.rentals << rental
    expect(@book.add_rental(rental)).to match_array(@book.rentals)
  end
end
