class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :result, :credit_card_number, :invoice_id
end
