# code start here
class Nameable
  def correct_name
    raise NotImplementedError, 'You must implement this method'
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  attr_accessor :nameable

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length > 10
      super.each_char.first(10).join
    else
      super
    end
  end
end
