class AddArchiveAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :archive_at, :timestamp
  end
end
