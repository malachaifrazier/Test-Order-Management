class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.integer :control_number

      t.timestamps
    end
  end
end
