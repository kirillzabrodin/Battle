require 'game'

describe Game do

  let(:kirill) { double :kirill }

  describe '#attack' do
    it 'damages the player' do
      expect(kirill).to receive(:receive_damage)
      subject.attack(kirill)
    end
  end
end
