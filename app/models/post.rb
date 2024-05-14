class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :created_by, class_name: "User", counter_cache: true
  belongs_to :updated_by, class_name: "User"
end
