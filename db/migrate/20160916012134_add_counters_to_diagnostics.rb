class AddCountersToDiagnostics < ActiveRecord::Migration[5.0]
  def change
    add_column :diagnostics, :score,         :integer, index: true, null: false, default: 0
    add_column :diagnostics, :answers_count, :integer, index: true, null: false, default: 0
  end
end
