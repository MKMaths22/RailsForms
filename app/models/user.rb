class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  valiates :email, uniqueness: true
  validates :password, presence: true
end
