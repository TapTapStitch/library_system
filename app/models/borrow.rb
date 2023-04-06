# frozen_string_literal: true

class Borrow < ApplicationRecord
  belongs_to :user
  belongs_to :book

  before_create :set_user_email
  before_destroy :set_book_status

  def set_book_status
    book.update(status: :available) if book.present?
  end

  def set_user_email
    self.user_email = user.email
  end
end
