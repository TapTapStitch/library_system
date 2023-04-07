# frozen_string_literal: true

class AddUserEmailToBorrows < ActiveRecord::Migration[7.0]
  def change
    add_column :borrows, :user_email, :string
  end
end
