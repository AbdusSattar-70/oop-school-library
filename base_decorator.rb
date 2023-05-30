require_relative 'nameable'
class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def corect_name
    @nameable.corect_name
  end
end
