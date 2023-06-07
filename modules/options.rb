class ManageOptions
  def initialize(app)
    @app = app
  end

  def display_option
    options = [
      'List all books',
      'List all people',
      'Create a person',
      'Create a book',
      'Create a rental',
      'List all rentals for a given person ID',
      'Exit'
    ]
    puts 'Please choose an option by entering a number:'
    options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
  end

  def create_book
    puts 'Title:'
    title = gets.chomp.capitalize
    puts 'Author:'
    author = gets.chomp.capitalize
    @app.create_book(title, author)
    puts 'Book created successfully!'
  end

  def list_all_books
    if @app.books.empty?
      puts 'Book list is empty!'
    else
      @app.list_all_books
    end
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
    @app.create_student(age, classroom, name, parent_permission)
    puts 'Person(student) created successfully!'
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    @app.create_teacher(age, specialization, name)
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
    if @app.people.empty?
      puts 'People list is empty!'
    else
      @app.list_all_people
    end
  end

  def list_all_rentals
    if @app.people.empty?
      puts 'People list is empty!'
    else
      print 'ID of a person: '
      id = gets.chomp.to_i
      person_rental = @app.list_all_rentals(id)
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

  def create_rental
    puts 'Select a book from the following list by number'
    @app.books.each_with_index do |book, i|
      puts "#{i} Title = #{book.title} Author = #{book.author}"
    end
    book_index = gets.chomp.to_i
    while book_index.negative? || book_index >= @app.books.length
      puts 'Invalid book index. Please select a valid book from the list:'
      book_index = gets.chomp.to_i
    end
    puts 'Select a person from the following list by number (not ID)'
    @app.people.each.with_index do |person, index|
      puts "#{index}) #{person.class.name} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    while person_index.negative? || person_index >= @app.people.length
      puts 'Invalid person index. Please select a valid person from the list:'
      person_index = gets.chomp.to_i
    end
    puts 'Date (YYYY-MM-DD):'
    date = gets.chomp
    @app.create_rental(date, person_index, book_index)
    puts 'Created the Rental successfully!'
  end
end
