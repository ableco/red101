class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :topic_id, index: true, null: false
      t.string  :content,  index: true, null: false

      t.timestamps
    end
  end
end
