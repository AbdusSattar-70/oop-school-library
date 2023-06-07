require_relative 'rental'

class Person
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission, :books

  def initialize(age, name, parent_permission, id = nil)
    @id = id || Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @books = []
  end

  def add_rental(rental, book)
    @rentals << rental
    @books << book
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
