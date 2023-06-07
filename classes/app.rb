require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
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

  def create_rental(date, person_index, book_index)
    selected_person = @people[person_index]
    selected_book = @books[book_index]

    if selected_person && selected_book
      rental = Rental.new(date, selected_person, selected_book)
      @rentals << rental
    else
      puts 'Invalid person index or book index.'
    end
  end

  def list_all_rentals(id)
    @people.find { |person| person.id == id }
  end

  def get_data_from_files(file)
    json_data = File.read(file)
    parsed_data = JSON.parse(json_data)
    convert_to_objects(parsed_data)
  rescue Errno::ENOENT
    # File not found error
    []
  end

  def find_book(book_title)
    @books.find { |b| b.title == book_title }
  end

  def find_person(person_id)
    @people.find { |p| p.id == person_id }
  end

  def convert_to_objects(parsed_data)
    parsed_data.map do |data|
      case data['type']
      when 'book'
        Book.new(data['title'], data['author'])
      when 'student'
        Student.new(data['age'], data['classroom'], data['name'], data['parent_permission'], data['id'])
      when 'teacher'
        Teacher.new(data['age'], data['specialization'], data['name'], data['id'])
      when 'rental'
        person_id = data['person']
        book_title = data['book']
        date = data['date']
        person = find_person(person_id)
        book = find_book(book_title)
        Rental.new(date, person, book)
      end
    end.compact
  end

  def convert_to_hashes(data)
    data.map do |object|
      case object
      when Book
        { 'type' => 'book', 'title' => object.title, 'author' => object.author }
      when Student
        { 'type' => 'student', 'age' => object.age, 'classroom' => object.classroom, 'name' => object.name,
          'parent_permission' => object.parent_permission, 'id' => object.id }
      when Teacher
        { 'type' => 'teacher', 'age' => object.age, 'specialization' => object.specialization, 'name' => object.name,
          'id' => object.id }
      when Rental
        { 'type' => 'rental', 'date' => object.date, 'person' => object.person.id, 'book' => object.book.title }
      end
    end
  end

  def store_data_in_files(file, data)
    serialized_data = JSON.pretty_generate(convert_to_hashes(data))
    File.write(file, serialized_data)
  end
end
