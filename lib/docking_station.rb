require "./lib/bike.rb"

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "No bikes available" if empty?
    raise "The bike is broken" if !@bikes.last.working?
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

  def report_status(bike)
    bike.brake
    dock(bike)
  end


private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
