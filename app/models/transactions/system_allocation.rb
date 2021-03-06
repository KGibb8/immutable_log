# frozen_string_literal: true

module Transactions
  class SystemAllocation < Transactions::Base
    validates :destination_rate,
              :destination_quantity,
              presence: true,
              numericality: { greater_than: 0 }

    validates :source_quantity,
              :source_rate,
              absence: true

    validates :source_type, inclusion: { in: ["Member"] }
    validates :destination_type, inclusion: { in: ["Member"] }

    def self.previous_transaction(member)
      ordered.for_destination(member)&.last
    end

    private

    def referring_transaction
      referring_transaction_to_destination
    end

    def publish_to_source
      # Debit source (member) equity
      equity_events.build(
        member: source,
        equity: -destination_quantity,
        coin: source_coin,
        rate: destination_rate
      )
    end

    def publish_to_destination
      # Credit destination (member) liability
      liability_events.build(
        rate: destination_rate,
        liability: destination_quantity,
        member: destination,
        coin: destination_coin
      )
    end
  end
end
