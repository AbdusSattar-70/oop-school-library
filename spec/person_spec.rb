require_relative '../classes/person'
require_relative '../classes/rental'
require_relative '../classes/book'
describe Person do
  before :each do
    @person = Person.new(32, 'Sattar', true)
    @book = Book.new('Hello world', 'Sattar')
    @rental = Rental.new(30 - 12 - 20, @person, @book)
  end
  it '#new or instance of Student class' do
    expect(@person).to be_instance_of Person
  end

  it 'Has attributes following' do
    expect(@person).to have_attributes(age: 32, name: 'Sattar', parent_permission: true)
  end

  it 'Checks add_rental method' do
    expect(@person.add_rental(@person, @book)).to match_array(@person.rentals && @person.books)
  end

  it 'Checks can_use_services? method' do
    expect(@person.can_use_services?).to eql(true)
  end
  it 'Checks correct_name method' do
    expect(@person.correct_name).to eql(@person.name)
  end
end
