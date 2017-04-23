module BooksHelper
  
  def image_from_amazon(isbn10)
    image_tag "http://images.amazon.com/images/P/#{isbn10}.01.ZTZZZZZZ.jpg"
  end

end