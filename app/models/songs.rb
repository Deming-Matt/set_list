class Songs < ApplicationRecord
  belongs_to :artist

  validates_presence_of :title
  validates_presence_of :length
  validates_presence_of :play_count
end
