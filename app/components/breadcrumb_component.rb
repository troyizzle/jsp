# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  attr_reader :items

  def initialize(items:)
    @items = items
  end

  def last_item?(item)
    items.last == item
  end
end
