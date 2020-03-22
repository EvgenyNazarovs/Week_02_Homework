class Bar

  attr_accessor :drinks, :rooms, :cash_register, :drinks_sold

  def initialize(drinks, rooms)
    @drinks = drinks
    @rooms = rooms
    @cash_register = Hash.new
    @drinks_sold = 0
  end

  def sell_item(guest, drink, room)
    if room.add_to_bar_tab(guest, drink.price)
      @drinks_sold += 1
    end
  end



end
