class Book < ApplicationRecord
  scope :finished, ->{ where.not(finished_on: nil)}
  scope :recent, ->{ where('finished_on > ?', 2.days.ago)}
  scope :search, ->(keyword){where('keywords Like ?',"%#{keyword.downcase}%") if keyword.present?}

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
      self.keywords = [title, author].map(&:downcase).join(' ')
    end

end
