# == Schema Information
#
# Table name: raffles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Raffle < ApplicationRecord
  has_many :tickets
  has_many :winners

  def self.create_with_tickets(count = 100)
    Raffle.create.tap do |raffle|
      count.times { Ticket.create(raffle: raffle) }
    end
  end

  # The draw method should return a ticket and remember that it was drawn
  def draw_winner
    # ...
  end
end
