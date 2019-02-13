class Trade < ApplicationRecord
  has_one :user

  include AASM
  aasm whiny_transitions: false do
    state :open, initial: true
    state :barter, :pending, :complete, :cancelled

    event :cancel do # user closes trade completely
      transitions from: [:open, :barter], to: :cancelled 
    end

    event :enter do # offer_user joins trade
      transitions from: :open, to: :barter
    end

    event :shake do # both user and offer_user accept quantities
      transitions from: :barter, to: :pending
    end

    event :trade do # once trade has taken place
      transitions from: :pending, to: :complete 
    end
  end

  def self.open
    where(aasm_state: [:open])
  end

  def self.closed
    where(aasm_state: [:pending, :cancelled, :complete])
  end
end
