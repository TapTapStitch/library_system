# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  Pagy::DEFAULT[:items] = 5

  def user_is_admin?
    return if current_user.admin?

    redirect_to root_path, alert: 'You must be Admin to access that.'
  end

  def user_is_librarian?
    return if current_user.librarian? || current_user.admin?

    redirect_to root_path, alert: 'You must be Librarian to access that.'
  end
end
