class Card < ActiveRecord::Base
  after_initialize do
    self.start = "2000-01-01 09:30:00"
    self.end = "2000-01-01 18:30:00"
    self.reststart = "2000-01-01 12:00:00"
    self.restend = "2000-01-01 13:00:00"
  end
end
