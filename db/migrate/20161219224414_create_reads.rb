class CreateReads < ActiveRecord::Migration[5.0]
  def change
    create_table :reads do |t|
      t.integer :link_id
      t.string :link_url
      t.string :link_title
      t.timestamps
    end
  end
end
