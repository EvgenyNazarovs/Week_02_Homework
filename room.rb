class Room

  attr_reader :name, :capacity
  attr_accessor :playlist, :current_occupiers

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @playlist = []
    @current_occupiers = []
  end

  def add_song_to_room(song)
    @playlist << song
  end

  def current_number_of_occupiers
    return @current_occupiers.size
  end

  def add_guest_to_room(guest)
    if @current_occupiers.size < @capacity
      @current_occupiers << guest
    else
      return "Not enough space in the room."
    end 
  end




end
