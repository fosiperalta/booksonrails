class CreateSessions < ActiveRecord::Migration
  def up
  	create_table 'sessions' do |t|
  		t.string 'username'
  		t.datetime 'login_date'
  		t.timestamps
  	end
  end

 def down ; drop_table 'sessions' ; end
end
