#what you code test should look in the terminal


➜  slot-machine✗ irb
[1] pry> require_relative "./slot_machine"
=> true
[2] pry> slot = SlotMachine.new
=> #<SlotMachine:0x00007f78553987b0 @reels=["seven", "cherry", "seven"]>
[3] pry> slot.score
=> 0
[4] pry> slot.play
=> ["star", "seven", "cherry"]
[5] pry> slot.score
=> 0
[6] pry> slot.play
=> ["bell", "joker", "seven"]
[7] pry> slot.score
=> 0
[8] pry> slot.play
=> ["star", "star", "star"]
[9] pry> slot.score
=> 40
[10] pry>
