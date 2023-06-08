require_relative '../classes/teacher'
describe Teacher do
  before :each do
    @teacher = Teacher.new(32, 'specialization', 'Sattar', 452)
  end
  it '#new or instance of Teacher class' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'Has attributes following' do
    expect(@teacher).to have_attributes(age: 32, specialization: 'specialization', name: 'Sattar', id: 452,
                                        parent_permission: true)
  end

  it 'Checks can_use_services? method' do
    expect(@teacher.can_use_services?).to eql(true)
  end
end
