require_relative '../book'

module CreateBook
  def create_book
    puts 'Title:'
    title = gets.chomp.capitalize
    puts 'Author:'
    author = gets.chomp.capitalize
    @books.push(Book.new(title, author))
    puts 'Book created successfully!'
  end
end
