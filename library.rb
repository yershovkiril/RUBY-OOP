require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require 'YAML'

class Library
  attr_accessor :books, :authors, :orders, :readers

  def initialize
    @books = []
    @authors = []
    @orders = []
    @readers = []
  end

  def add_new_book(book)
    @books << book.title unless @books.include? book.title
    @authors << book.author unless @authors.include? book.author
  end

  def order_book(book, reader)
    return puts 'We don\'t have the book' unless @books.include? book.title
    @readers << Reader.new(reader) unless @readers.include? reader
    @orders << Order.new(book, reader)
  end

  def save_all_data
    File.open('test.txt', 'w') { |f| f.write YAML.dump(self) }
  end

  def self.read_all_data
    begin
      YAML.load(File.read('test.txt'))
    rescue Errno::ENOENT
      puts 'No such file'
    end
  end

  def who_often_takes(book)
    return puts 'We don\'t have the book' unless @books.include? book.title
    readers_by_book = @orders.select { |order| order.book.title == book.title }
    p sort_orders(readers_by_book.map(&:reader).map(&:name)).last[0]
  end

  def the_most_popular_book
    return puts 'No books ordered' if @orders.empty?
    p sort_orders(@orders.map(&:book)).last[0].title
  end

  def count_people_read_popular_books
    puts @orders.group_by(&:book).max_by(3).map { |k,v| v[0].reader }.uniq.count
  end


  private
  def sort_orders(item)
    item.each_with_object(Hash.new(0)) { |key, hash| hash[key] +=1 }.sort_by { |_reader, value| value }
  end
end
