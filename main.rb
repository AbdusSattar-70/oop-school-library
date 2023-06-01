require_relative 'app'

OPTIONS = {
  1 => :list_all_books,
  2 => :list_all_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_all_rentals,
  7 => :exit
}.freeze

MENU_OPTIONS = [
  'List all books',
  'List all people',
  'Create a person',
  'Create a book',
  'Create a rental',
  'List all rentals for a given person ID',
  'Exit'
].freeze

def display_option
  puts 'Please choose an option by entering a number:'
  MENU_OPTIONS.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
end

def app_start(app)
  loop do
    display_option
    user_input = gets.chomp.to_i

    if OPTIONS.key?(user_input)
      run = OPTIONS[user_input]
      app.send(run)
      break if run == :exit
    else
      puts 'Enter the correct option: '
    end
  end
end

def main
  app = App.new
  puts 'Welcome to the School Library App!'
  app_start(app)
end

main
