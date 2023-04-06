# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :borrows, dependent: :destroy
  has_many :users, through: :borrows
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :ISBN, presence: true
  validates :published_date, presence: true

  enum status: { available: 0, borrowed: 1 }
end
