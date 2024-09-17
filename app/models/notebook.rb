class Notebook < ApplicationRecord
  has_many :chapters, dependent: :destroy
  belongs_to :user

  def status
    return 'not-started' if chapters.none?
    if chapters.all? { |chapter| chapter.complete?}
      'complete'
    elsif chapters.any? { |chapter| chapter.in_progress? || chapter.complete?}
      'in-progress'
    else
      'not-started'
    end
  end

  def percent_complete
    total = chapters.count
    return 0 if total.zero?

    complete_chapters = chapters.count { |chapter| chapter.complete? }
    ((complete_chapters.to_f / total) * 100).round
  end
  def total_complete
    chapters.select { |chapter| chapter.complete?}.count
  end
  def total_chapters
    chapters.count
  end
end

