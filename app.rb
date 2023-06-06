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
      JSON.parse(json_data)
    rescue JSON::ParserError
      []
    end
  end

  def store_data_in_files(file, data)
    File.write(file, JSON.generate(data))
  end
end
