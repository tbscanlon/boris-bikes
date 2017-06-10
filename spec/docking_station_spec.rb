require "docking_station.rb"
require "bike.rb"

describe DockingStation do
  let(:docking_station) { DockingStation.new}

  describe "capacity" do
    it "can be set by the user" do
      docking_station = DockingStation.new(25)
      expect(docking_station.capacity).to eq (25)
    end

    context "when nothing is provided by the user" do
      it "defaults to 20" do
        docking_station = DockingStation.new
        expect(docking_station.capacity).to eq(20)
      end
    end
  end

  it "gets a bike and expects it to be working" do
    docking_station.dock(double(:bike, working?: true))
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  describe "#dock" do
    it "won't dock a bike if full" do
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock double(:bike, working?: true) }
      expect{docking_station.dock(double(:bike, working?: true))}.to raise_error("Docking station is full")
    end
  end

  describe "#report_status" do
    it "will learn from the user if the bike is broken" do
      bike = double(:bike, working?: false, brake: "broken")
      docking_station.report_status(bike)
      expect(bike).not_to be_working
    end

    it "will dock a broken bike" do
      bike = double(:bike, working?: false, brake: "broken")
      docking_station.report_status(bike)
      expect(docking_station.bikes.last).to eq bike
    end
  end

  describe "#release_bike" do
    it "can release a bike if there is a bike available" do
      bike = double(:bike, working?: true)
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it "won't release a bike if there are none available" do
      expect{(docking_station.release_bike)}.to raise_error("No bikes available")
    end

    it "won't release a broken bike" do
      bike = double(:bike, working?: false)
      docking_station.dock(bike)
      expect{(docking_station.release_bike)}.to raise_error("The bike is broken")
    end
  end
end
