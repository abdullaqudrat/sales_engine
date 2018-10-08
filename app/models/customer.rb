class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :first_name, :last_name

  def self.favorite_merchant(customer_id)
    Merchant
    .select("merchants.*, COUNT(merchants.id) as count")
    .joins(invoices: [:transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: {customer_id: customer_id})
    .group(:id)
    .order("count DESC")
    .limit(1).last
  end
end
