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

  def self.best_day(item_id)
    Invoice.select("invoices.*, SUM(invoice_items.quantity) AS sold")
    .joins(:invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .where(invoice_items: { item_id: item_id })
    .group(:id)
    .order("sold DESC, created_at DESC")
    .first
    .created_at
  end
end
