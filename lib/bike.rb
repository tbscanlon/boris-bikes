class Bike

  attr_reader :status

  def initialize(status = "good")
    @status = status
  end

  def working?
    @status == "good"
  end

  def brake
    @status = "broken"
  end

end
