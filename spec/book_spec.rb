require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new('Hello world', 'Sattar')
  end
  it 'should create an instance of Book class' do
    expect(@book).to be_instance_of Book
  end
end
