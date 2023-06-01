require_relative 'book'
require_relative 'student'
require_relative 'teacher'
class App
  def initialize
    @books = []
    @people = []
  end

  def create_book
    puts 'Title:'
    title = gets.chomp.capitalize
    puts 'Author:'
    author = gets.chomp.capitalize
    @books.push(Book.new(title, author))
    puts 'Book created successfully!'
  end

  def list_all_books
    @books.each { |book| puts "Title: #{book.title} Author: #{book.author}" }
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'classroom: '
    classroom = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.upcase
    until %w[Y N].include?(parent_permission)
      print 'Has parent permission? (Y/N): '
      parent_permission = gets.chomp.upcase
    end
    student = Student.new(age, classroom, name, parent_permission: true) if parent_permission == 'Y'
    student = Student.new(age, classroom, name, parent_permission: false) if parent_permission == 'N'
    @people << student
    puts 'Person(student) created successfully!'
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
    puts 'Person(Teacher) created successfully!'
  end

  def create_person
    number = nil
    until %w[1 2].include?(number)
      puts 'Do you want to create a student(1) or a teacher(2)? [Input the number 1 or 2 only]: '
      number = gets.chomp
    end

    case number
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def list_all_people
    @people.each { |person| puts "ID: #{person.id} Name: #{person.name} Age: #{person.age}" }
  end
end

dis = App.new
dis.create_person
dis.list_all_people
