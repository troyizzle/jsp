class User < ApplicationRecord
  THEMES = %w[light dark].freeze
  TOPICS_PER_PAGE = [5, 10, 15, 20, 25, 50].freeze
  POSTS_PER_PAGE = [5, 10, 15, 20, 25].freeze
  SETTINGS_FORMS = ["general", "password", "avatar"].freeze

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :trackable

  has_many :topics, foreign_key: "created_by_id", dependent: :destroy, counter_cache: true
  has_many :posts, foreign_key: "created_by_id", dependent: :destroy, counter_cache: true

  def to_param
    username
  end
end
