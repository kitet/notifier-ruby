class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table(:subscriptions) do |t|
     t.column(:company_id, :int)
     t.column(:subscriber_id, :int)
    end
  end
end
