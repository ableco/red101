class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.integer :topic_id, null: false, index: true
      t.string  :title,    null: false, index: true
      t.string  :url,      null: false, index: true
      t.string  :details,  null: false, index: true

      t.timestamps
    end
  end
end
