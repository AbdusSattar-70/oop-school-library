require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def list_all_books
    @books.each { |book| puts "Title: #{book.title} Author: #{book.author}" }
  end

  def create_student(age, classroom, name, parent_permission)
    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    @people << student
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
  end

  def list_all_people
    @people.each { |person| puts "ID: #{person.id} Name: #{person.name} Age: #{person.age}" }
  end

  def create_rental(date, people, book)
    Rental.new(date, people, book)
  end

  def list_all_rentals(id)
    @people.find { |person| person.id == id }
  end

  def get_data_from_files(file)
    json_data = File.read(file)
    begin
      parsed_data = JSON.parse(json_data)
      convert_to_objects(parsed_data)
    rescue JSON::ParserError
      []
    end
  end

  def convert_to_objects(parsed_data)
    parsed_data.map do |data|
      case data['type']
      when 'book'
        Book.new(data['title'], data['author'])
      when 'student'
        Student.new(data['age'], data['classroom'], data['name'], parent_permission: data['parent_permission'])
      when 'teacher'
        Teacher.new(data['age'], data['specialization'], data['name'])
      end
    end
  end

  def convert_to_hashes(data)
    data.map do |object|
      case object
      when Book
        { 'type' => 'book', 'title' => object.title, 'author' => object.author }
      when Student
        { 'type' => 'student', 'age' => object.age, 'classroom' => object.classroom, 'name' => object.name,
          'parent_permission' => object.parent_permission }
      when Teacher
        { 'type' => 'teacher', 'age' => object.age, 'specialization' => object.specialization, 'name' => object.name }
      end
    end
  end

  def store_data_in_files(file, data)
    serialized_data = JSON.pretty_generate(convert_to_hashes(data))
    File.write(file, serialized_data)
  end
end
