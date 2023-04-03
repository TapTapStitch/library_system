# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { student: 0, librarian: 1, admin: 2 }
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    role || :student
  end
end
