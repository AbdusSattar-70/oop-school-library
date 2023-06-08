require_relative '../classes/base_decorator'
require_relative '../classes/nameable'
describe BaseDecorator do
  before :each do
    @nameable = Nameable.new
    @base_decorator = BaseDecorator.new(@nameable)
  end

  it 'Should be instance of BaseDecorator class' do
    expect(@base_decorator).to be_instance_of BaseDecorator
  end

  it 'Checks correct_name method Should raise a NotImplementedError' do
    expect { @base_decorator.correct_name }.to raise_error(NotImplementedError)
  end
end
