class Read < ApplicationRecord
  def mark_read_count
    count = self.read_count || 0
    count += 1
    self.update(read_count: count)
  end
end
