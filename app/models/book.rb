class Book < ApplicationRecord
  has_many :book_genres
  has_many :genres, through: :book_genres
  scope :finished, ->{ where.not(finished_on: nil)}
  scope :recent, ->{ where('finished_on > ?', 2.days.ago)}
  scope :search, ->(keyword){where('keywords Like ?',"%#{keyword.downcase}%") if keyword.present?}
  scope :filter_by_genre, ->(name){ joins(:genres).where('genres.name = ?', name) if name.present?}

  before_save :set_keywords

  def finished?
    finished_on.present?
  end

  def rating_descr
    case rating
    when 1,2
      return "bad"
    when 3
      return "average"
    else
      return "good"
    end
  end

  protected
    def set_keywords
      book_genres = ''
      self.genres.each do |g|
        books_genres << g.name + ',' 
      end
      self.keywords = [title, author, books_genres].map(&:downcase).join(' ')
    end

end
