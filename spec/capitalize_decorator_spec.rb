require_relative '../classes/capitalize_decorator'

describe CapitalizeDecorator do
  before :each do
    person = double('Person', rentals: [])
    allow(person).to receive(:age) { 35 }
    allow(person).to receive(:name) { 'sattar' }
    allow(person).to receive(:parent_permission) { true }
    allow(person).to receive(:correct_name).and_return(person.name)
    @capdecorator = CapitalizeDecorator.new(person)
  end

  it '#correct_name should return Capitalize name' do
    expect(@capdecorator.correct_name).to eq('Sattar')
  end
end