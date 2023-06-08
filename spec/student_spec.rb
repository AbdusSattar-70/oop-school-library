require_relative '../classes/student'
describe Student do
  before :each do
    @student = Student.new(32, "class-1", 'Sattar', true)
  end
it '#new or instance of Student class' do
  expect(@student).to be_instance_of Student
end

it 'Has attributes following' do
  expect(@student).to have_attributes(age: 32, classroom: 'class-1', parent_permission: true)
end

it 'Checks classroom setter method' do
  expect(@student.classroom).to eql(@student.classroom)
end

it 'Checks play_hooky method' do
  expect(@student.play_hooky).to eql('¯(ツ)/¯')
end

end