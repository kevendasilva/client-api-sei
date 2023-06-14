class Parking < ApplicationRecord
  self.table_name = 'parkings'

  attribute :id
  attribute :name, :string
  attribute :address, :string
  attribute :opening_time, :time
  attribute :closing_time, :time
end