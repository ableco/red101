class AddDetails < ActiveRecord::Migration[5.0]
  def change
    rename_column :materials,   :details,     :description
    add_column    :topics,      :description, :string
    add_column    :templates,   :description, :string
    add_column    :diagnostics, :reference,   :string
  end
end
