class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods do |t|
      t.string :cardholder_name
      t.string :card_number
      t.string :validity
      t.integer :security_code
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
