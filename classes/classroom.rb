class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
  end
end
