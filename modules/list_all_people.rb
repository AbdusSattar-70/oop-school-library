module ListAllPeople
  def list_all_people
    if @people.empty?
      puts 'People list is empty!'
    else
      @people.each { |person| puts "ID: #{person.id} Name: #{person.name} Age: #{person.age}" }
    end
  end
end
