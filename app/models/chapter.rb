class Chapter < ApplicationRecord
  belongs_to :notebook

  validates :status, inclusion: {in: ['not-started', 'in-progress', 'complete']}

  STATUS_OPTIONS = [
    ['Not Started', 'not-started'],
    ['In Progress', 'in-progress'],
    ['Complete', 'complete']
  ]

  def complete?
    status == 'complete'
  end
  def in_progress?
    status == 'in-progress'
  end
  def not_started?
    status == 'not-started'
  end
end
