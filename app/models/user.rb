# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :token, presence: true
end
