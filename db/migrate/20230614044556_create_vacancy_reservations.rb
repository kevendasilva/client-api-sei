class CreateVacancyReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancy_reservations do |t|
      t.references :client, null: false, foreign_key: true
      t.references :vacancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
