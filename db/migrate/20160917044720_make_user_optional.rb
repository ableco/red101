class MakeUserOptional < ActiveRecord::Migration[5.0]
  def change
    change_column_null :diagnostics, :user_id, true
  end
end
