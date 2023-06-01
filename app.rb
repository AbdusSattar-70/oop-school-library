require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
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
      print 'Do you want to create a student(1) or a teacher(2)? [Input the number 1 or 2 only]: '
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

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, i|
      puts "#{i} Title = #{book.title} Author = #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    @people.each.with_index do |person, index|
      puts "#{index}) #{[person.class.name]} Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date(YYYY-MM-DD):'
    date = gets.chomp
    Rental.new(date, @people[person_index], @books[book_index])
    puts 'Created the Rental successfully!'
  end

  def list_all_rentals
    print 'ID of a person: '
    id = gets.chomp.to_i

    person_rental = @people.find { |person| person.id == id }

    if person_rental
      puts 'Rentals:'
      person_rental.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    else
      puts 'Person not found!'
    end
  end
end
