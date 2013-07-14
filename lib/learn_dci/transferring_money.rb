class TransferringMoney
  include Context

  def self.transfer source_account_id, destination_account_id, amount
    source = Account.find(source_account_id)
    destination = Account.find(destination_account_id)
    TransferringMoney.new(source, destination).transfer amount
  end

  attr_reader :source_account, :destination_account

  def initialize source_account, destination_account
    @source_account = source_account.extend SourceAccount
    @destination_account = destination_account.extend DestinationAccount
  end

  def transfer amount
    in_context do
      source_account.transfer_out amount
    end
  end

  module SourceAccount
    include ContextAccessor

    def transfer_out amount
      raise 'Insufficient funds' if balance < amount
      decrease_balance amount
      context.destination_account.transfer_in amount
      update_log 'Transferred out', amount
    end
  end

  module DestinationAccount
    include ContextAccessor

    def transfer_in amount
      increase_balance amount
      update_log 'Transferred in', amount
    end
  end

end