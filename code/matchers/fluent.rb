require 'spec_helper'

class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end
end

Spec::Matchers.define :be_the do |rank|
  match do |card|
    card.rank == rank && card.suit == @suit
  end
  
  def of(suit)
    @suit = suit
    self
  end
end


describe Card do
  describe "Ace of spades" do
    it "is the Ace of spades" do
      card = Card.new('Ace', :spades)
      card.should be_the('Ace').of(:spades)
    end
  end
end
