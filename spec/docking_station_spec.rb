require 'app'

RSpec.describe DockingStation do
  context "when releasing a bike" do
    it { is_expected.to respond_to :release_bike }

    it "Releases working bikes" do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end
end
