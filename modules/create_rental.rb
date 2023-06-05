require_relative '../rental'

module CreateRental
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
end

