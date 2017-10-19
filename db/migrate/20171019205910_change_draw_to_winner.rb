class ChangeDrawToWinner < ActiveRecord::Migration[5.1]
  def change
    rename_table :draws, :winners
  end
end
