class DockingStation
  def initialize
  end

  def release_bike
  	Bike.new
  end
end

class Bike
  def working?
    true
  end
end
