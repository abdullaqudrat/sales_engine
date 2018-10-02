require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:status)}
  end
  describe 'Relationships' do
    it {should belong_to(:customer)}
    it {should belong_to(:merchant)}
    it {should have_many(:transactions)}
    it {should have_many(:items).through(:invoice_items)}
  end
end
