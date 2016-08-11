class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.integer :question_id, index: true, null: false
      t.string  :content,     index: true, null: false
      t.boolean :correct,     index: true, null: false, default: false

      t.timestamps
    end
  end
end
