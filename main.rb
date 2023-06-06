require_relative 'app'
require_relative 'modules/options'
OPTIONS = {
  1 => :list_all_books,
  2 => :list_all_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_all_rentals,
  7 => :exit
}.freeze

def app_start(manage_option, app)
  loop do
    manage_option.display_option
    user_input = gets.chomp.to_i

    if OPTIONS.key?(user_input)
      run = OPTIONS[user_input]
      if run == :exit
        puts 'Exit'
        app.store_data_in_files('data/people.json', app.people)
        app.store_data_in_files('data/books.json', app.books)
        break
      end
      manage_option.send(run)
    else
      puts 'Enter the correct option: '
    end
  end
end

def main
  app = App.new
  app.books = app.get_data_from_files('data/books.json')
  app.people = app.get_data_from_files('data/people.json')
  manage_option = ManageOptions.new(app)
  puts 'Welcome to the School Library App!'
  app_start(manage_option, app)
end
main
