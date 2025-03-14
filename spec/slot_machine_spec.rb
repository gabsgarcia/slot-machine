require_relative "../slot_machine"

describe SlotMachine do
  # TODO

  # score
  # test for each combination
  describe "#score" do
    # Test for three different symbols (no match)
    it "returns 0 for 3 different symbols" do
      slot_machine = SlotMachine.new(["joker", "star", "bell"])
      expect(slot_machine.score).to eq(0)
    end
    # Tests for three of a kind
    it "returns 50 for 3 jokers" do
      slot_machine = SlotMachine.new(["joker", "joker", "joker"])
      expect(slot_machine.score).to eq(50)
    end

    it "returns 40 for 3 stars" do
      slot_machine = SlotMachine.new(["star", "star", "star"])
      expect(slot_machine.score).to eq(40)
    end

    it "returns 30 for 3 bells" do
      slot_machine = SlotMachine.new(["bell", "bell", "bell"])
      expect(slot_machine.score).to eq(30)
    end

    it "returns 20 for 3 sevens" do
      slot_machine = SlotMachine.new(["seven", "seven", "seven"])
      expect(slot_machine.score).to eq(20)
    end

    it "returns 10 for 3 cherrys" do
      slot_machine = SlotMachine.new(["cherry", "cherry", "cherry"])
      expect(slot_machine.score).to eq(10)
    end

    # Test for two jokers + anything
    it "returns 25 for 2 jokers + anything" do
      slot_machine = SlotMachine.new(["joker", "joker", "star"])
      expect(slot_machine.score).to eq(25)
    end

    # Tests for two of a kind + joker
    it "returns 20 for 2 stars and a joker" do
      slot_machine = SlotMachine.new(["star", "star", "joker"])
      expect(slot_machine.score).to eq(20)
    end

    it "returns 15 for 2 bells and a joker " do
      slot_machine = SlotMachine.new(["bell", "bell", "joker"])
      expect(slot_machine.score).to eq(15)
    end

    it "returns 10 for 2 sevens and a joker" do
      slot_machine = SlotMachine.new(["seven", "seven", "joker"])
      expect(slot_machine.score).to eq(10)
    end

    it "returns 5 for 2 cherrys and a joker" do
      slot_machine = SlotMachine.new(["cherry", "cherry", "joker"])
      expect(slot_machine.score).to eq(5)
    end
  end
end
