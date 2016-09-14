class AddSlugToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :slug, :string, index: true, null: false
  end
end
