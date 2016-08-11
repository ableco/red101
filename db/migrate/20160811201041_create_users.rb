class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, index: true, null: false
      t.string :last_name,  index: true, null: false
      t.string :phone,      index: true
      t.string :level,      index: true
      t.string :location,   index: true
      t.string :school,     index: true
      t.string :role,       index: true
      t.string :since,      index: true
      t.string :about,      index: true

      t.string  :email,           null: false, index: { unique: true }
      t.string  :password_digest, null: false
      t.boolean :admin,           null: false, index: true, default: false

      t.timestamps
    end
  end
end
