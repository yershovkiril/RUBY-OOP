require_relative 'library'

library = Library.new
andersen = Author.new('Hans Christian Andersen', 'Danish author and poet')
grim = Author.new('Brothers Grimm', 'The Brothers Grimm: Jacob and Wilhelm Grimm')

book_1 = Book.new("Angel", andersen)
book_2 = Book.new("Bell", andersen)
book_3 = Book.new("Bearskin", grim)
book_4 = Book.new("Blue Light", grim)

reader_1 = Reader.new("Reader1")
reader_2 = Reader.new('Reader2')
reader_3 = Reader.new("Reader3")
reader_4 = Reader.new('Reader4')

library.add_new_book(book_1)
library.add_new_book(book_2)
library.add_new_book(book_3)
library.add_new_book(book_4)

library.order_book(book_1, reader_2)
library.order_book(book_1, reader_3)
library.order_book(book_1, reader_3)
library.order_book(book_1, reader_4)
library.order_book(book_4, reader_4)
library.order_book(book_2, reader_1)
library.order_book(book_3, reader_2)
library.order_book(book_2, reader_3)
library.order_book(book_3, reader_4)

library.the_most_popular_book
library.count_people_read_popular_books
library.who_often_takes(book_1)

library.save_all_data
p Library.read_all_data