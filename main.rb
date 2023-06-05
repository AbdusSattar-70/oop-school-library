require_relative 'modules/options'
require_relative 'modules/create_person'
require_relative 'app'
class Main
  include DisplayOption
  include CreatePerson
  def initialize
    main
  end

  def main
    app = App.new
    puts 'Welcome to the School Library App!'
    app_start(app)
  end
end
Main.new
