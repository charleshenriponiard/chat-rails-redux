class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.text :content

      t.timestamps
    end
  end
end
