class Prospect < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true

  has_many :interactions, dependent: :destroy

  def status
    last_interaction = interactions.order(occurred_at: :desc).first
    return "🆕 New" unless last_interaction

    case last_interaction.kind
    when "contacted"
      "📞 Contacted"
    when "interested"
      "⭐ Interested"
    when "won"
      "✅ Won"
    when "lost"
      "❌ Lost"
    else
      "❓ Unknown"
    end
  end
end
