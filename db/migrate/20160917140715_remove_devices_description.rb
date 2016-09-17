class RemoveDevicesDescription < ActiveRecord::Migration[5.0]
  def change
    remove_column :devices, :description, :string
    add_column    :devices, :user_agent,  :string, index: true
  end
end
