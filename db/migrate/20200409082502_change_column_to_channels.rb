class ChangeColumnToChannels < ActiveRecord::Migration[5.2]
  def change
    remove_column :channels, :content
    add_column :channels, :name, :string
  end
end
