class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  validates_presence_of :name

  def self.most_revenue(limit = 5)
    select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order("revenue DESC")
    .limit(limit)
  end

  def self.most_items_sold(limit = 5)
    select("merchants.*, sum(invoice_items.quantity) AS quantity_sold")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order("quantity_sold DESC")
    .limit(limit)
  end

  def self.all_revenue_by_date(date)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: {updated_at: date.to_date.beginning_of_day..date.to_date.end_of_day})
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end

  def self.total_revenue(merchant_id)
    joins(invoices: [:invoice_items, :transactions])
    .where(invoices: { merchant_id: merchant_id })
    .merge(Transaction.unscoped.successful)
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end

  def total_revenue_by_date(date)
    invoices
    .joins(:invoice_items, :transactions)
    .merge(Transaction.unscoped.successful)
    .where(invoices: {updated_at: date.to_date.beginning_of_day..date.to_date.end_of_day})
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end

  def self.favorite_customer(merchant_id)
    Customer
    .select("customers.*, COUNT(customers.id) as count")
    .joins(invoices: [:transactions])
    .merge(Transaction.unscoped.successful)
    .where(invoices: { merchant_id: merchant_id})
    .group(:id)
    .order("count DESC")
    .limit(1)
    .first
  end
end
