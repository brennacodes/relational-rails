class CreateDivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :address
      t.string :jurisdiction
      t.integer :num_active_cases
      t.boolean :is_federal

      t.timestamps
    end
  end
end
