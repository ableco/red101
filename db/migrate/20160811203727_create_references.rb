class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.integer :topic_id,    null: false, index: true
      t.integer :template_id, null: false, index: true

      t.timestamps
    end

    add_index :references, %i( topic_id template_id ), unique: true
  end
end
