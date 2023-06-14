class VacancyReservation < ApplicationRecord
  belongs_to :client
  belongs_to :vacancy
end
