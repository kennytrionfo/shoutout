class User < ActiveRecord::Base

  validates :first_name, :last_name, :mood, presence: true

  def self.by_mood(mood)
    where(mood: mood)
  end
  
end
