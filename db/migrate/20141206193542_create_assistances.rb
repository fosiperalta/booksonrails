class CreateAssistances < ActiveRecord::Migration
  def up
    create_table 'assistances' do |t|
      t.references 'user'
      t.references 'meeting'
      t.text 'books'
    end
  end
  def down ; drop_table 'assistances' ; end
end
