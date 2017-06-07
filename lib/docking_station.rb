require_relative "bike.rb"

class DockingStation
  attr_reader :capacity, :docks

  def initialize(capacity=20)
    @docks, @capacity = Array.new, capacity
  end

  def release_bike
    raise 'No bikes left' if @docks.empty?
    @docks.pop
  end

  def dock(bike)
    raise "Docking Station is full" if @docks.length >= @capacity
    @docks.push(bike)
    bike.docked = true
    @bike = bike # remove in future?
  end

  def view_bikes # remove in future?
    docks
  end
end
