class RenameToReferer < ActiveRecord::Migration[5.0]
  def change
    rename_column :visits, :referrer, :referer
  end
end
