class User < ActiveRecord::Base
    has_one :workout
    has_many :exercises, through: :workout

    has_secure_password #password, password=, authenticate

    # def play_in_venue(venue, date)
        #option 1 - AR no Associations
        # Concert.create(venue: venue, band: self, date: date)
        #option 2 (better) - with association methods
        # self.concerts.create(venue: venue, date: date)
    # end

    # def all_introductions
    #     self.concerts.map(&:introduction)
    # end

    # def self.most_performances
        #good   
        # self.all.max_by{|band| band.concerts.length}
        #better
        # self.preload(:concerts).all.max_by{|band| band.concerts.length}
        #best
        # self.joins(:concerts).group(:band_id).order("COUNT(bands.id) DESC").limit(1)
    # end

end
