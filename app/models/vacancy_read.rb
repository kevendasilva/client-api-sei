class VacancyRead < ApplicationRecord
  self.table_name = 'vacancies'

  attribute :id
  attribute :code, :string
  attribute :kind, :integer
end