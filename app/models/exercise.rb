class Exercise < ActiveRecord::Base
    has_many :exercises
    has_many :users, through: :exercises

    # def concert_on(date)
    #     self.concerts.find_by_date(date)
    # end

    # def most_frequent_band
        #option 1 - ruby iterators
        # self.bands.tally.max_by{|k , v| v}.first
        #option 2 - hybrid approach
        # self.bands.max_by {|band| band.concerts.where(venue: self).length}
        #option 3 - AR query methods
        # self.class.joins(:concerts, :bands).where(venue_id: self.id).group(:band_id).order("COUNT(concerts.id) DESC").limit(1)
    # end
end

