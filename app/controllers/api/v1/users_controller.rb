class Api::V1::UsersController < ApplicationController
  before_action :check_admin_user, except: [:index]

  def index
    users = User.sorted

    render json: users, root: :users
  end

  def create
    user = User.new user_params
    user.password = Devise.friendly_token.first(8)

    if user.save
      render json: user.reload, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find params[:id]

    user.attributes = user_params

    if user.save
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def check_admin_user
    render json: false, status: :forbidden and return unless current_user.admin
  end

  def user_params
    params.require(:user).permit!
  end
end
