require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission, id = nil)
    super(age, name, parent_permission, id)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
