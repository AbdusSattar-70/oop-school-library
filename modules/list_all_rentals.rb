module ListAllRentals
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
