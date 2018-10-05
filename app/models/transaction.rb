class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number, :result

  default_scope { order(:id) }
  scope :successful, -> { where(result: "success") }
end
