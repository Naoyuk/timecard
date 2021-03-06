class Card < ActiveRecord::Base
  after_initialize :set_default, if: :new_record?
  
  scope :date_between, -> from, to do
    if from.present? && to.present?
      where(date: from..to)
    elsif from.present?
      where('date >= ?', from)
    elsif to.present?
      where('date <= ?', to)
    end
  end
  
  private
  def set_default 
    d = Time.now
    self.date ||= Date.today
    self.start ||= Time.local(d.year, d.month, d.day, 9, 30, 0)
    self.end ||= Time.local(d.year, d.month, d.day, 18, 30, 0)
    self.reststart ||= Time.local(d.year, d.month, d.day, 12, 0, 0)
    self.restend ||= Time.local(d.year, d.month, d.day, 13, 0, 0)
  end
end
