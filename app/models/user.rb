# frozen_string_literal: true

class User < ApplicationRecord
  has_many :borrows, dependent: :destroy
  has_many :books, through: :borrows
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { student: 0, librarian: 1, admin: 2 }
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    role || :student
  end
end
