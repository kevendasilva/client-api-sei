class AddInformationToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :telephone, :string
    add_column :clients, :cpf, :string
  end
end
