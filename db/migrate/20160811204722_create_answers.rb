class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :diagnostic_id,  index: true, null: false
      t.integer :question_id,    index: true, null: false
      t.integer :option_id,      index: true
      t.string  :option_content, index: true
      t.boolean :option_correct, index: true, null: false, default: false

      t.timestamps
    end
  end
end
