class CreateDiagnostics < ActiveRecord::Migration[5.0]
  def change
    create_table :diagnostics do |t|
      t.integer  :template_id, index: true, null: false
      t.integer  :user_id,     index: true, null: false
      t.datetime :finished_at, index: true

      t.timestamps
    end
  end
end
