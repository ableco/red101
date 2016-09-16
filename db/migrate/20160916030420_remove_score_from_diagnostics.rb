class RemoveScoreFromDiagnostics < ActiveRecord::Migration[5.0]
  def change
    remove_column :diagnostics, :score, :integer, null: false, index: true, default: 0
  end
end
