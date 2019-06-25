class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :order_number

  attribute :num_items do |object|
      object.items.count
    end
  end
