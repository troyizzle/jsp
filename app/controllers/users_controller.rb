class UsersController < ApplicationController
  before_action :load_user

  def show
  end

  private

  def load_user
    @user = User.find_by(username: params[:id])
  end
end
