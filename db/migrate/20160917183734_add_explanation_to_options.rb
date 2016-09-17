class AddExplanationToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :explanation, :string
  end
end
