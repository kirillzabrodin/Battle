require 'player'

describe Player do

  subject(:kirill) { described_class.new("Kirill") }
  subject(:chris) { described_class.new("Chris") }

  describe "#name" do
    it 'can read the name' do
      expect(kirill.name).to eq "Kirill"
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(kirill.hitpoints).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { kirill.receive_damage }.to change { kirill.hitpoints }.by(-10)
    end
  end
end
