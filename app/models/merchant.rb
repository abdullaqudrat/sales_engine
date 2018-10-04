class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  validates_presence_of :name

  def self.most_revenue(limit = 5)
    select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(:invoices, :invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order("revenue DESC")
    .limit(limit)
  end

  def self.most_items_sold(limit = 5)
    select("merchants.*, sum(invoice_items.quantity) AS quantity_sold")
    .joins(:invoices, :invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order("quantity_sold DESC")
    .limit(limit)
  end

  def self.all_revenue_by_date(date)
    joins(:invoices, :invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .where(invoices: {updated_at: "#{date}"})
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end

  def total_revenue
    invoices
    .joins(:invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end

  def total_revenue_by_date(date)
    invoices
    .joins(:invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .where(invoices: {updated_at: "#{date}"})
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end

  def favorite_customer
    
  end
end
