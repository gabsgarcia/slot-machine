# SlotMachine class simulates a 3-reel slot machine game
# Each reel can display one of 5 different symbols
# The score is calculated based on specific combinations

class SlotMachine

  # Constants define the possible items and their score values
  # Using constants makes the code more maintainable - if we want to add new symbols
  # or change scores, we only need to modify these constants
  ITEMS = ["joker", "star", "bell", "seven", "cherry"]

  # Scores for getting three of the same symbol
  # Using a hash gives us a clean and easier access  for the scores
  THREE_OF_A_KIND = {
    "joker" => 50,
    "star" => 40,
    "bell" => 30,
    "seven" => 20,
    "cherry" => 10
  }

  # Scores for getting two of the same symbol plus a joker
  TWO_AND_JOKER = {
    "star" => 20,
    "bell" => 15,
    "seven" => 10,
    "cherry" => 5
  }

  # Constructor - sets up the initial state of the slot machine
  def initialize(reels = [])
    # Store the reels in an instance variable
    # If empty, they'll be populated when play is called
    @reels = reels
  end

  # method to simulate playing the slot machine
  def play
    # clear the existing reels
    @reels = []
    # select 3 random new items
    3.times do
      @reels << ITEMS.sample
    end

    # Return the new reels so player can see what they got
    return @reels
  end

  # Calculate the score based on the current reels
  def score

    # Count occurrences of each item using a hash
    # Hash.new(0) creates a hash where new keys start with value 0
    counts = Hash.new(0)

    # Count occurrences of each item using a hash
    @reels.each { |item| counts[item] += 1}

    # Check each scoring rule in order
    # Rule 1: Three of the same item
    @reels.each do |item|
      # check if I have an item happening 3 times
      if counts[item] == 3
        # if it does we will get their value from the constant created earlier
        return THREE_OF_A_KIND[item]
      end
    end

    # Rule 2: Two jokers + anything
    # check if I have the key "joker" happening two times
    if counts["joker"] == 2
      return 25
    end

    # Rule 3: Two of the same + joker
    # check first if I have a joker
    if counts["joker"] == 1
      # goes over all the items in the reels
      @reels.each do |item|
        # if it finds one that it's different from the joker and happen two times
        if item != "joker" && counts[item] == 2
          # gets the value of the item from the constant created earlier
          return TWO_AND_JOKER[item]
        end
      end
    end

    # if nothing of the earlier conditions happen then its the score 0
    return 0
  end
end
