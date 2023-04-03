# frozen_string_literal: true

class PagesController < ApplicationController
  ALLOWED_ROLES = %w[student librarian].freeze
  before_action :authenticate_user!, only: [:update_user_role]
  before_action :user_is_admin?, only: [:update_user_role]

  def index; end

  def update_user_role
    @users = User.where(role: [0, 1])

    return unless params[:email].present? && params[:role].present?

    @user = User.find_by(email: params[:email], role: [0, 1])
    if @user.present?
      return unless check_allowed_role

      @user.update(role: params[:role])
      redirect_to update_user_role_path, notice: 'User role updated successfully.'
    else
      redirect_to update_user_role_path, alert: 'User not found.'
    end
  end

  private

  def check_allowed_role
    if ALLOWED_ROLES.include?(params[:role])
      true
    else
      flash.alert = 'Such role not exits'
      false
    end
  end
end
