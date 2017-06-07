require "bike.rb"

describe Bike do
  it { is_expected.to respond_to :working? } #1
  it { is_expected.to respond_to :docked?} #2

end
