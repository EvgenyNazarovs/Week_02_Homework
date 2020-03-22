class Room

  attr_reader :name, :capacity
  attr_accessor :playlist, :current_occupiers, :bar_tab

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @playlist = []
    @current_occupiers = []
    @entry_fee = entry_fee
    @bar_tab = Hash.new(0)
  end

  def add_song_to_room(song)
    @playlist << song
  end

  def current_number_of_occupiers
    return @current_occupiers.size
  end

  def enough_money?(guest, amount)
    return true if guest.wallet >= amount
  end

  def has_capacity?
    return true if @current_occupiers.size < @capacity
  end

  def add_guest_to_room(guest)
    if enough_money?(guest, @entry_fee) && has_capacity?()
          @current_occupiers << guest
          guest.wallet -= @entry_fee
        elsif !has_capacity?()
          return "Not enough space in the room."
        elsif !enough_money?(guest, @entry_fee)
          return "Not enough money to enter the room."
    end
  end

  def add_to_bar_tab(guest, amount)
    if enough_money?(guest, amount)
      if @bar_tab[guest.name]
        @bar_tab[guest.name] += amount
      else
        @bar_tab[guest.name] = amount
      end
    else return "Not enough money."
    end
  end

end
