module ListAllBooks
  def list_all_books
    if @books.empty?
      puts 'Book list is empty!'
    else
      @books.each { |book| puts "Title: #{book.title} Author: #{book.author}" }
    end
  end
end
