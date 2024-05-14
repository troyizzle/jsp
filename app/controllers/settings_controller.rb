class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tab, only: :show

  def show
  end

  def update
    if current_user.update(settings_params)
      redirect_to settings_path, notice: "Settings updated successfully."
    else
      render :index
    end
  end

  private

  def set_tab
    @tab = "general"

    if params[:tab] && User::SETTINGS_FORMS.include?(params[:tab])
      @tab = params[:tab]
    end
  end

  def settings_params
    params.require(:user).permit(:theme, :topics_per_page, :posts_per_page, :avatar_url)
  end
end
