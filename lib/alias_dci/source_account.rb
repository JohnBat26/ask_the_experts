require 'alias_dci'

module SourceAccount
  include AliasDCI::Role

  def transfer_out(amount)
    raise "Insufficient funds" if balance < amount
    @balance = @balance - amount
    puts "The amount #{amount} was deducted from the account."
    puts "The new balance is now #{@balance}."
  end
end