class MovementRead < ApplicationRecord
    self.table_name = 'movements'
  
    attribute :id
    attribute :cost, :float
    attribute :client_id
    attribute :vehicle_id
  end