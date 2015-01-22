class ChangeDataTypeForMeetingDate < ActiveRecord::Migration
  def self.up
    create_table 'meetings' do |t|
	  	t.string 'title'
	  	t.datetime 'date'
	  	t.string 'country'
	  	t.string 'city'
	  	t.text 'direction'
	  	t.string 'creator'
	  	t.timestamps
	  end
  end

  def down
  end
end
