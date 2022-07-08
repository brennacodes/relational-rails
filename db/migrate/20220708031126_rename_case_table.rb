class RenameCaseTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :cases, :investigations
  end
end
