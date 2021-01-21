class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    if !Artist.all.find{|artist| artist.name == "Drake"}
      drake = Artist.create(name: "Drake")
      drake.songs << self
    else
      Artist.find_by(name: "Drake").songs << self
    end
  end
end