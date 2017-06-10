require "bike.rb"

describe Bike do
  it "responds to working?" do
    expect(subject).to respond_to :working?
  end

  it "responds to brake" do
    expect(subject).to respond_to :brake
  end

  it "changes the status of the bike" do
    subject.brake
    expect(subject.status).to eq "broken"
  end

end
