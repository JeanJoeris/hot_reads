class CreateReads < ActiveRecord::Migration[5.0]
  def change
    create_table :reads do |t|
      t.integer :link_id

      t.timestamps
    end
  end
end
