class AddReadCountToReads < ActiveRecord::Migration[5.0]
  def change
    add_column :reads, :read_count, :integer, default: 0
  end
end
