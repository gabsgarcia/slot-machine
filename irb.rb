slot-machine irb
[1] pry(main)> require_relative './slot_machine'
=> true
[2] pry(main)> slot = SlotMachine.new
=> #<SlotMachine:0x00007f46ead77d40 @reels=[]>
[3] pry(main)> slot.play
=> ["bell", "seven", "seven"]
[4] pry(main)> slot.score
=> 0
[5] pry(main)> slot.play
=> ["seven", "bell", "cherry"]
[6] pry(main)> slot.score
=> 0
[7] pry(main)> slot.play
=> ["star", "joker", "cherry"]
[8] pry(main)> slot.score
=> 0
[9] pry(main)> slot.play
=> ["cherry", "star", "star"]
[10] pry(main)> slot.score
=> 0
[11] pry(main)> slot.play
=> ["seven", "seven", "star"]
[12] pry(main)> slot.score
=> 0

