class Shout < ActiveRecord::Base

  validates :message, presence: true

end
