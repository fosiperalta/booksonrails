##########################################################################################
# Seeding de la tabla Book
more_books = [
  {:title => 'La Biblia', :author => 'Dios'}
]
Book.send(:attr_accessible, :title, :author, :isbn10, :isbn13, :publisher, :summary)
more_books.each do |book|
  Book.create!(book)
end
##########################################################################################