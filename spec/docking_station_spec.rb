require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}  #1

  describe "#release_bike" do
    it "raises an error when there are no bikes" do #7
      expect { subject.release_bike }.to raise_error("No bikes left")
    end

    it "releases working bikes" do #2
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
  end

  describe '#dock' do
    it "docks a bike" do                  #4
      bike = Bike.new
      expect(subject.dock(bike)).to eq (bike)
    end

    it { is_expected.to respond_to(:dock).with(1).argument}

    it "sees docked bikes" do #6
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'raises an error when the station is full' do
      bike = Bike.new
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error("Docking Station is full")
    end
  end

  it { is_expected.to respond_to(:view_bikes) } #5

  # it "sees docked bikes" do
  #   expect(subject.view_bikes).to eq subject.number_of_bikes
  # end

end
