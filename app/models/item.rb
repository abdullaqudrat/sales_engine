class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  validates_presence_of :name, :description, :unit_price

  def self.most_revenue(limit = 5)
    select("items.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(:invoice_items, :invoices, :transactions)
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order("revenue DESC")
    .limit(limit)
  end

  def self.most_sold(limit = 5)
    select("items.*, SUM(invoice_items.quantity) AS sold")
    .joins(:invoice_items, :invoices, :transactions)
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order("sold DESC")
    .limit(limit)
  end
end
