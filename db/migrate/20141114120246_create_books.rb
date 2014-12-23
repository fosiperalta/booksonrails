class CreateBooks < ActiveRecord::Migration
  def up
  	create_table 'books' do |t|
	  	t.string 'title'
	  	t.string 'author'
	  	t.string 'isbn10'
	  	t.string 'isbn13'
	  	t.string 'publisher'
	  	t.text 'summary'
	  	t.timestamps
	  end
  end

  def down
  	drop_table 'books' 
  end
end
