class Interaction < ApplicationRecord
  belongs_to :prospect

  enum :kind, [ :contacted, :interested, :won, :lost ]

  validates :occurred_at, presence: true
end
