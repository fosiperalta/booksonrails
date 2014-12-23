class ChangeDataTypeForMeetingDate < ActiveRecord::Migration
  def self.up
    change_table :meetings do |t|
      t.change :date, :datetime
    end
  end

  def down
  end
end
