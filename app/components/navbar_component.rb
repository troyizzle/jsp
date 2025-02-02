# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  attr_reader :user

  def initialize(user:)
    @user = user
  end
end
