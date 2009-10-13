require 'spec_helper'

class Glass; end

class Cachaça; end

Spec::Matchers.define :cachaça do
  match do |actual|
    Cachaça === actual
  end
end

describe "glass" do
  context "when empty" do
    it "should be filled with cachaça" do
      glass = Glass.new
      glass.should_receive(:fill).with(cachaça)
      glass.fill(Cachaça.new)
    end
  end
end

