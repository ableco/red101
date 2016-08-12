class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.integer  :user_id,     null: false, index: true
      t.integer  :kind,        null: false, index: true, default: 0
      t.string   :description, null: false, index: true
      t.string   :token,       null: false, index: { unique: true }
      t.datetime :expires_at,  index: true

      t.timestamps
    end
  end
end
