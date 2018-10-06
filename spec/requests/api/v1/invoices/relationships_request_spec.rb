require "rails_helper"

describe "Invoice API" do
  it "can send transactions associated with the invoice" do
    invoice = create(:invoice)
    create_list(:transaction, 5, invoice: invoice)
    create(:transaction)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(Transaction.all.count).to eq(6)
    expect(transactions.count).to eq(5)
  end
  it "can send invoice_items associated with the invoice" do
    invoice = create(:invoice)
    create_list(:invoice_item, 5, invoice: invoice)
    create(:invoice_item)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(InvoiceItem.all.count).to eq(6)
    expect(invoice_items.count).to eq(5)
  end
  it "can send items associated with the invoice" do
    invoice = create(:invoice)
    item_1, item_2, item_3 = create_list(:item, 3)
    create_list(:invoice_item, 5, invoice: invoice, item: item_1 )

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(Item.all.count).to eq(3)
    expect(items.count).to eq(1)
  end
  it "can send customers associated with the invoice" do
    create_list(:customer, 5)
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_successful

    customers = [JSON.parse(response.body)]

    expect(Customer.all.count).to eq(6)
    expect(customers.count).to eq(1)
  end
  it "can send merchants associated with the invoice" do
    create_list(:merchant, 5)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_successful

    merchants = [JSON.parse(response.body)]

    expect(Merchant.all.count).to eq(6)
    expect(merchants.count).to eq(1)
  end
end
