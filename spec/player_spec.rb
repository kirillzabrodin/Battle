require 'player'

describe Player do

  subject(:person) { described_class.new("Person name") }

  describe "#name" do
    it 'can read the name' do
      expect(person.name).to eq "Person name"
    end
  end
end
