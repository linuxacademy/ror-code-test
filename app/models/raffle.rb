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
  has_many :draws

  def self.create_with_tickets(count = 100)
    Raffle.create.tap do |raffle|
      count.times { Ticket.create(raffle: raffle) }
    end
  end

  def draw
    # ...
  end
end
