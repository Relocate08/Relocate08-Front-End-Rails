# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :name
      t.string :token
    end
  end
end
