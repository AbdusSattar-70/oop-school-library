require_relative '../classes/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('y2')
    @student = double('Student')
    allow(@student).to receive(:age) { 35 }
    allow(@student).to receive(:classroom) { 'y2' }
    allow(@student).to receive(:name) { 'Albert' }
    allow(@student).to receive(:parent_permission) { true }
  end

  it 'Should be instance of Classroom' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'Has two properties' do
    expect(@classroom).to have_attributes(label: 'y2')
  end

  it 'Checks add_student method' do
    expect(@classroom.add_student(@student)).to include(@student)
  end
end
