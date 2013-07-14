require_relative '../alias_dci/account'
require_relative '../alias_dci/source_account'


SourceAccount.make_role!(:source_account)
Account.send :include, SourceAccount

source = Account.new
source.transfer_out(100) #=> No Method Error
source.add_role(SourceAccount)
source.transfer_out(100) #=> The amount 100 was deducted from the account.
source.remove_role(SourceAccount)
source.transfer_out(100) #=> No Method Error