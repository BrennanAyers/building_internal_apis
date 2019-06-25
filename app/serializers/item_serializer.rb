class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description

  attribute :num_orders do |object|
    object.orders.count
  end
end
