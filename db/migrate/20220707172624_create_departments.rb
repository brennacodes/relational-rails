class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :address
      t.string :jurisdiction
      t.integer :active_cases
      t.boolean :is_federal

      t.timestamps
    end
  end
end
