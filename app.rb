require_relative 'book'
require_relative 'rental'
require_relative 'modules/create_person'
require_relative 'modules/create_book'

class App
  include CreatePerson
  include CreateBook
  def initialize
    @books = []
    @people = []
  end

  def list_all_books
    if @books.empty?
      puts 'Book list is empty!'
    else
      @books.each { |book| puts "Title: #{book.title} Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'People list is empty!'
    else
      @people.each { |person| puts "ID: #{person.id} Name: #{person.name} Age: #{person.age}" }
    end
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
    if @people.empty?
      puts 'People list is empty!'
    else
      print 'ID of a person: '
      id = gets.chomp.to_i

      person_rental = @people.find { |person| person.id == id }

      if person_rental
        puts 'Rentals:'
        person_rental.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      else
        puts 'Person not found! May be ID is incorrect'
      end
    end
  end
end
