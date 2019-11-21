class Order < ApplicationRecord

  enum pay_type: {
    "Credit Cart" => 1,
    "Debit Cart" => 2,
    "Cash" => 3,
  }

  validates :name, :email, :address, presence: true
  validates :pay_type, inclusion: pay_types.keys

end
