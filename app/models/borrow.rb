# frozen_string_literal: true

class Borrow < ApplicationRecord
  BOOKS_LIMIT = 5
  belongs_to :user
  belongs_to :book

  before_create :set_user_email
  before_destroy :set_book_status

  validate :user_books_limit, on: :create

  def set_book_status
    book.update(status: :available) if book.present?
  end

  def set_user_email
    self.user_email = user.email
  end

  def user_books_limit
    return unless user.borrows.count >= BOOKS_LIMIT

    errors.add(:user, "already has borrowed #{BOOKS_LIMIT} books. Return book to take another.")
  end
end
