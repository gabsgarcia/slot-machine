require_relative "../slot_machine"

describe SlotMachine do
  # TODO
  # test for different combination
  describe "#score" do
    # test for 3 different no matchs
    it "returns 0 for three different symbols" do
      slot_machine = SlotMachine.new(["joker", "star", "bell"])
      expect(slot_machine.score).to eq(0)
    end

    # test for 3 of the same
    it "returns 50 for three jokers symbols" do
      slot_machine = SlotMachine.new(["joker", "joker", "joker"])
      expect(slot_machine.score).to eq(50)
    end

    it "returns 40 for three stars symbols" do
      slot_machine = SlotMachine.new(["star", "star", "star"])
      expect(slot_machine.score).to eq(40)
    end

    it "returns 30 for three bells symbols" do
      slot_machine = SlotMachine.new(["bell", "bell", "bell"])
      expect(slot_machine.score).to eq(30)
    end

    it "returns 20 for three sevens symbols" do
      slot_machine = SlotMachine.new(["seven", "seven", "seven"])
      expect(slot_machine.score).to eq(20)
    end

    it "returns 10 for three cherrys symbols" do
      slot_machine = SlotMachine.new(["cherry", "cherry", "cherry"])
      expect(slot_machine.score).to eq(10)
    end

    # test for 2 jokers + anything
    it "returns 25 for two jokers + anything symbols" do
      slot_machine = SlotMachine.new(["joker", "joker", "star"])
      expect(slot_machine.score).to eq(25)
    end

    # test for 2 anything + joker
    it "returns 20 for two stars + joker symbols" do
      slot_machine = SlotMachine.new(["star", "star", "joker"])
      expect(slot_machine.score).to eq(20)
    end

    it "returns 15 for two bells + joker symbols" do
      slot_machine = SlotMachine.new(["bell", "bell", "joker"])
      expect(slot_machine.score).to eq(15)
    end

    it "returns 10 for two sevens + joker symbols" do
      slot_machine = SlotMachine.new(["seven", "seven", "joker"])
      expect(slot_machine.score).to eq(10)
    end

    it "returns 5 for two cherrys + joker symbols" do
      slot_machine = SlotMachine.new(["cherry", "cherry", "joker"])
      expect(slot_machine.score).to eq(5)
    end
  end
end
