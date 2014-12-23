class CreateMeetings < ActiveRecord::Migration
  def up
  	create_table 'meetings' do |t|
	  	t.string 'title'
	  	t.string 'date'
	  	t.string 'country'
	  	t.string 'city'
	  	t.text 'direction'
	  	t.string 'creator'
	  	t.timestamps
	  end
  end

  def down
  	drop_table 'meetings' 
  end
end
