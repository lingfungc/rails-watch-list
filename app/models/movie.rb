class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :nullify

  validates :title, :overview, presence: true
  validates :title, uniqueness: true
end
