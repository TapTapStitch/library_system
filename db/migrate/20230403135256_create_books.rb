# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :ISBN
      t.date :published_date
      t.integer :status, limit: 1, default: 0, null: false

      t.timestamps
    end
  end
end
