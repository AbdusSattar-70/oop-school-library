require_relative '../classes/trimmer_decorator'

describe TrimmerDecorator do
  before :each do
    person = double('Person', rentals: [])
    allow(person).to receive(:age) { 35 }
    allow(person).to receive(:name) { 'sattarMondol' }
    allow(person).to receive(:parent_permission) { true }
    allow(person).to receive(:correct_name).and_return(person.name)
    @trimmer_decorator = TrimmerDecorator.new(person)
  end

  it '#correct_name should return trim name range(1..9)' do
    expect(@trimmer_decorator.correct_name).to eq('sattarMond')
  end
end
