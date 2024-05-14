class Forum < ApplicationRecord
  belongs_to :category

  has_many :children, class_name: "Forum", inverse_of: :parent, foreign_key: :parent_id
  belongs_to :parent, class_name: "Forum", inverse_of: :children, optional: true

  has_many :topics

  scope :top_level, -> { where(parent_id: nil) }

  def build_breadcrumb
    items = [{name: category.title, url: category}]

    parent_topic = parent

    while parent_topic
      items.push({name: parent_topic.title, url: parent_topic})

      parent_topic = parent_topic.parent
    end

    items.push({name: title, url: self})
  end
end
