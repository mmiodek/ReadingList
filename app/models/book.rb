class Book < ApplicationRecord
  scope :finished, ->{ where.not(finished_on: nil)}
  scope :recent, ->{ where('finished_on > ?', 2.days.ago)}

  def finished?
    finished_on.present?
  end

  def has_author?
    author.present?
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

end
