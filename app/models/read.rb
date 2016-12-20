class Read < ApplicationRecord

  def self.top_reads
    where('updated_at > ?', 24.hours.ago).order(read_count: :desc).limit(10)
  end

  def mark_read_count
    count = self.read_count || 0
    count += 1
    self.update(read_count: count)
  end
end
