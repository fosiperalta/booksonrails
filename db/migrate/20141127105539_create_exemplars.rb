class CreateExemplars < ActiveRecord::Migration

  def up
    create_table 'exemplars' do |t|
      t.boolean    'shareable'
      t.references 'user'
      t.references 'book'
    end
  end
  def down ; drop_table 'exemplars' ; end
end
