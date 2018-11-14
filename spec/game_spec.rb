require 'game'

describe Game do

  let(:kirill) { double :kirill, receive_damage: true, dead?: false}
  let(:kirill_dead) { double :kirill, receive_damage: true, dead?: true }
  let(:chris) { double :chris, receive_damage: true, dead?: false }
  subject(:game) { described_class.new(kirill, chris) }
  subject(:finished_game) { described_class.new(kirill_dead, chris) }

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

  describe '#opponent_of' do
    it 'finds the opponent of a player' do
      expect(game.opponent_of(kirill)).to eq chris
      expect(game.opponent_of(chris)).to eq kirill
    end
  end

  describe "#game_over?" do
    it 'returns true if either player is below 1HP' do
      expect(finished_game.game_over?).to eq true
    end

    it 'returns false if neither player is below 1HP' do
      expect(game.game_over?).to eq false
    end
  end
end
