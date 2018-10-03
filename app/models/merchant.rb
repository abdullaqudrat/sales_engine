class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  validates_presence_of :name

  def self.most_revenue(limit = 5)
    select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(:invoices)
    .joins("INNER JOIN invoice_items ON invoices.id=invoice_items.invoice_id")
    .joins("INNER JOIN transactions ON invoices.id=transactions.invoice_id")
    .where(transactions: {result: "success"})
    .group(:id)
    .order("revenue DESC")
    .limit(limit)
  end
end
