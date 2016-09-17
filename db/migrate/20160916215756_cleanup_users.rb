class CleanupUsers < ActiveRecord::Migration[5.0]
  def change
    add_column    :users, :name,       :string, null: false, index: true
    remove_column :users, :first_name, :string, null: false, index: true
    remove_column :users, :last_name,  :string, null: false, index: true
    remove_column :users, :phone,      :string
    remove_column :users, :level,      :string
    remove_column :users, :location,   :string
    remove_column :users, :school,     :string
    remove_column :users, :role,       :string
    remove_column :users, :since,      :string
    remove_column :users, :about,      :string
  end
end
