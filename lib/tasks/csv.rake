require 'csv'

namespace :csv do
  desc "TODO"
  task import: :environment do
    CSV.foreach('./lib/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create(row.to_h)
    end
    CSV.foreach('./lib/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      Invoice_item.create(row.to_h)
    end
    CSV.foreach('./lib/invoices.csv', headers: true, header_converters: :symbol) do |row|
      Inovice.create(row.to_h)
    end
    CSV.foreach('./lib/items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      Item.create(row.to_h)
    end
    CSV.foreach('./lib/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create(row.to_h)
    end
    CSV.foreach('./lib/transactions.csv', headers: true, header_converters: :symbol) do |row|
      Transaction.create(row.to_h)
    end
  end
end
