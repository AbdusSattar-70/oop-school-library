require_relative 'modules/options.rb'
require_relative 'app'
class Main
  include DisplayOption
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
