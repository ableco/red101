class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.integer :material_id, index: true, null: false
      t.integer :user_id,     index: true
      t.string  :referrer,    index: true

      t.timestamps
    end
  end
end
