# frozen_string_literal: true

class User::CardComponent < ViewComponent::Base
  attr_reader :user

  def initialize(user:)
    @user = user
  end
end
