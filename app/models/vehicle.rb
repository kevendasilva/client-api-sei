class Vehicle < ApplicationRecord
  belongs_to :client
  has_many :movements
end
