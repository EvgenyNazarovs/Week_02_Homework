class Room

  attr_reader :name, :capacity
  attr_accessor :playlist, :current_occupiers

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @playlist = []
    @current_occupiers = []
    @entry_fee = entry_fee
  end

  def add_song_to_room(song)
    @playlist << song
  end

  def current_number_of_occupiers
    return @current_occupiers.size
  end

  def enough_money?(guest)
    return true if guest.wallet >= @entry_fee
  end

  def has_capacity?
    return true if @current_occupiers.size < @capacity
  end

  def add_guest_to_room(guest)
    if enough_money?(guest) && has_capacity?()
          @current_occupiers << guest
          guest.wallet -= @entry_fee
        elsif !has_capacity?()
          return "Not enough space in the room."
        elsif !enough_money?(guest)
          return "Not enough money to enter the room."
    end
  end
  end
