require('pry')
require('pry-byebug')

class Guest

  attr_reader :name, :favourite_song
  attr_accessor :wallet

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def cheer_to_favourite_song(room)
    room.playlist.map do |song|
      return "Whoo!" if @favourite_song == song.name
    end
  end



end
