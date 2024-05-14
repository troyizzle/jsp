# frozen_string_literal: true

class User::SignatureComponent < ViewComponent::Base
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def parse_signature
    return if user.signature.blank?
    # replace [CENTER] with <center> aND [/CENTER] with </center>
    # replace [IMG]src[/IMG] with <img src="src">
    user.signature.gsub!("[CENTER]", "<center>").gsub!("[/CENTER]", "</center>")
      .gsub!("[IMG]", "<img src=\"").gsub!("[/IMG]", "\">")
  end
end
