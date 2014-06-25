class User < ActiveRecord::Base

  validates :first_name, :last_name, :mood, presence: true

  def by_mood

  end
end
