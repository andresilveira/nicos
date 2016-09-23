class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :url
      t.string :title

      t.timestamps
    end

    add_index :websites, :url
  end
end
