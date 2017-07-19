class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table(:companies) do |table|
        table.column(:name, :string)
        table.column(:email, :varchar)
        table.timestamps()
    end
  end
end
