class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.string :subject
      t.string :uid
      t.boolean :active
      t.integer :active_leads
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
