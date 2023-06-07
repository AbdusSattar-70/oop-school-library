require_relative 'person'

class Teacher < Person
  attr_reader :age, :specialization, :name

  def initialize(age, specialization, name, id, parent_permission: true)
    super(age, name, parent_permission, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
