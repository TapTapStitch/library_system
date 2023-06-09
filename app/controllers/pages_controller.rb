# frozen_string_literal: true

class PagesController < ApplicationController
  ALLOWED_ROLES = %w[student librarian].freeze
  before_action :authenticate_user!, only: %i[manage_users delete_user]
  before_action :user_is_admin?, only: %i[manage_users delete_user]

  def index; end

  # rubocop:disable all
  def manage_users
    @users = User.where(role: [0, 1])

    return unless params[:email].present? && params[:role].present?

    @user = User.find_by(email: params[:email], role: [0, 1])

    if @user.present? && check_allowed_role
      @user.update(role: params[:role])
      redirect_to manage_users_path, notice: 'User role updated successfully.'
    else
      flash.alert = 'User not found.' unless @user.present?
      flash.alert = 'Invalid role.' unless check_allowed_role
      redirect_to manage_users_path
    end
  end

  def delete_user
    @user = User.find_by(email: params[:email], role: [0, 1])

    if @user.destroy
      redirect_to manage_users_path, notice: "User deleted."
    else
      redirect_to manage_users_path, notice: "User not found."
    end
  end

  # rubocop:enable all

  private

  def check_allowed_role
    ALLOWED_ROLES.include?(params[:role])
  end
end
