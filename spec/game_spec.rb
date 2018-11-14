require 'game'

describe Game do

  let(:kirill) { double :kirill, receive_damage: true }
  let(:chris) { double :chris, receive_damage: true }
  subject(:game) { described_class.new(kirill, chris) }

  describe '#attack' do
    it 'damages the player' do
      expect(kirill).to receive(:receive_damage)
      subject.attack(kirill)
    end
  end

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq kirill
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq chris
    end
  end

  describe "#current_turn" do
    it 'starts as player 1' do
      expect(game.current_turn).to eq kirill
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq chris
    end
  end
end
