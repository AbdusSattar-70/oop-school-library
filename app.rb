require_relative 'book'
require_relative 'rental'
require_relative 'modules/create_person'
require_relative 'modules/create_book'
require_relative 'modules/create_rental'

class App
  include CreatePerson
  include CreateBook
  include CreateRental
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
