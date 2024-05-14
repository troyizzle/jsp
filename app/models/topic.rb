class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :created_by, class_name: "User"

  has_many :posts, dependent: :destroy

  validates :title, presence: true

  def breadcrumbs
    items = forum.build_breadcrumb

    items.push({name: title, url: self})

    items
  end
end
