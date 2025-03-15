# SlotMachine class simulates a 3-reel slot machine game
# Each reel can display one of 5 different symbols
# The score is calculated based on specific combinations
class SlotMachine
  # Constants define the possible items and their score values
  # Using constants makes the code more maintainable - if we want to add new symbols
  # or change scores, we only need to modify these constants

  # list of all the symbols we have in the slot machine
  ITEMS = ["joker", "star", "bell", "seven", "cherry"]

  # Using a hash to store the scores for three of a kind
  THREE_OF_A_KIND = {
    "joker" => 50,
    "star" => 40,
    "bell" => 30,
    "seven" => 20,
    "cherry" => 10
  }

  # Another hash for two of the same + joker
  TWO_OF_A_KIND = {
    "star" => 20,
    "bell" => 15,
    "seven" => 10,
    "cherry" => 5
  }


  def initialize(reels = [])
    # The ternary operator (?:) checks if reels is empty:
		# If it is empty, it calls the play method to generate random reels.
		# If it's not empty, it uses the provided reels.
    @reels = reels.empty? ? play : reels
  end

  # Public method - the interface others will use
  def score
    # Using smaller private methods for readability
    # It uses the || (logical OR) operator in a clever way:
		# It tries three_of_a_kind_score first.
		# If that returns nil (no match), it tries two_jokers_score.
		# If that returns nil, it tries two_plus_joker_score.
		# If all return nil, it returns 0 (no win).
    return three_of_a_kind_score || two_jokers_score || two_plus_joker_score || 0
  end

  # Public method to "play" the slot machine by generating random reels
  def play
    # create a new array of 3 symbols, randomly selected them from ITEMS
    @reels = Array.new(3) { ITEMS.sample }
  end

  private
  # This keyword marks the following methods as private.
	# Private methods can only be called within the class, not from outside.

  def item_counts
    # This method counts how many of each symbol appear in the reels.
		# Hash.new(0) creates a new hash with a default value of 0.
		# It iterates through each item in @reels and increments its count.
    counts = Hash.new(0) # counts = {"joker"=2, "start"= 1}
    @reels.each { |item| counts[item] += 1}
    counts
  end

  def three_of_a_kind_score
    # Private method to check for RULE 1 three of a kind
    # counts the times the symbols is in the @reel calling the method
    counts = item_counts
    # @reels.each do |item|
    #   if counts[item] == 3
    #     return THREE_OF_A_KIND[item]
    #   end
    # end
    item = @reels.find { |item| counts[item] == 3}
    item ? THREE_OF_A_KIND[item] : nil
  end

  def two_jokers_score
    # RULE 2 two jokers + anything
    counts = item_counts
    # if counts["joker"] == 2
    #   return 25
    # end
    counts["joker"] == 2 ? 25 : nil
  end

  def two_plus_joker_score
    # RULE 3 2 Anything + joker
    counts = item_counts
    # check if I have a joker
    # if counts["joker"] == 1
    #   @reels.each do |item|
    #     if item != "joker" && counts[item] == 2
    #       return TWO_OF_A_KIND[item]
    #     end
    #   end
    # end
    if counts["joker"] == 1
      item = @reels.find { |item| item != "joker" && counts[item] == 2 }
      item ? TWO_OF_A_KIND[item] : nil
    end
  end
end
