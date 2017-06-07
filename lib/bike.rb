class Bike
  attr_accessor :docked

  def initialize
    @docked = false
  end

  def working?
    true
  end

  def docked?
    @docked
  end
end
