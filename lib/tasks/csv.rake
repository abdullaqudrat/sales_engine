require 'csv'

namespace :csv do
  desc "TODO"
  task import: :environment do
    CSV.foreach('./lib/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create(row.to_h)
    end
    puts "imported merchants"
    CSV.foreach('./lib/items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      Item.create(row.to_h)
    end
    puts "imported items"
    CSV.foreach('./lib/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create(row.to_h)
    end
    puts "imported customers"
    CSV.foreach('./lib/invoices.csv', headers: true, header_converters: :symbol) do |row|
      Invoice.create(row.to_h)
    end
    puts "imported invoices"
    CSV.foreach('./lib/transactions.csv', headers: true, header_converters: :symbol) do |row|
      Transaction.create(row.to_h)
    end
    puts "imported transactions"
    CSV.foreach('./lib/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      InvoiceItem.create(row.to_h)
    end
    puts "imported invoiceitems"
  end
  task import_heroku: :environment do
    row_counter = 0
    CSV.foreach('./lib/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create(row.to_h)
    end
    puts "imported merchants"
    CSV.foreach('./lib/items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      Item.create(row.to_h)
    end
    puts "imported items"
    CSV.foreach('./lib/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create(row.to_h)
    end
    puts "imported customers"
    CSV.foreach('./lib/invoices.csv', headers: true, header_converters: :symbol) do |row|
      if row_counter <= 2000
        Invoice.create(row.to_h)
        row_counter += 1 
      else
        row_counter = 0
        break
      end
    end
    puts "imported invoices"
    CSV.foreach('./lib/transactions.csv', headers: true, header_converters: :symbol) do |row|
      if row_counter <= 2000
        Transaction.create(row.to_h)
        row_counter += 1          
      else
        row_counter = 0
        break
      end
    end
    puts "imported transactions"
    CSV.foreach('./lib/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      if row_counter <= 2000
        row[:unit_price] = row[:unit_price].to_f / 100
        InvoiceItem.create(row.to_h)
        row_counter += 1
      else
        row_counter = 0
        break
      end
    end
    puts "imported invoiceitems"
  end
end
