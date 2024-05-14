class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :forums, dependent: :destroy

  has_many :top_level_forums, -> { top_level }, class_name: "Forum"
end
