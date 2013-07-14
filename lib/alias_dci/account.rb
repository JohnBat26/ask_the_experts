require 'alias_dci'

class Account
  include AliasDCI::DataObject
  attr_accessor :role
  attr_accessor :balance

  def initialize
    @balance = 1000
  end

end
