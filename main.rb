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

def app_start(manage_option)
  loop do
    manage_option.display_option
    user_input = gets.chomp.to_i

    if OPTIONS.key?(user_input)
      run = OPTIONS[user_input]
      manage_option.send(run)
      break if run == :exit
    else
      puts 'Enter the correct option: '
    end
  end
end

def main
  app = App.new
  manage_option = ManageOptions.new(app)
  puts 'Welcome to the School Library App!'
  app_start(manage_option)
end
main
