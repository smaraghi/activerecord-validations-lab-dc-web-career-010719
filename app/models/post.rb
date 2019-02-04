class Post < ActiveRecord::Base

  validates :title, presence: true
  validates(:content, { :length => { :minimum => 250 }})
  validates(:summary, { :length => { :maximum => 250 }})
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_click_bait?

  def is_click_bait?
      
      if self.title && !self.title.match(/(Won't Believe|Secret|Guess|Top \d)/)
        errors.add(:title, "not clickbaity")
    end
  end
end
