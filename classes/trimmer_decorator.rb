require_relative 'base_decorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.strip[0..9]
  end
end
