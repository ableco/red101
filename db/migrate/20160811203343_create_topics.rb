class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :info, null: false, index: true, default: ''

      t.timestamps
    end
  end
end
