class AddVisitsCountToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :visits_count, :integer, index: true, default: 0
  end
end
