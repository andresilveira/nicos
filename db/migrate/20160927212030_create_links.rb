class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :text
      t.string :href
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
