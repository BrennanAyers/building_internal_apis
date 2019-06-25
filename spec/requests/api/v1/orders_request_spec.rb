require 'rails_helper'

describe "Orders API" do
  it "sends a list of orders" do
    create_list(:order, 3)

    get '/api/v1/orders'

    expect(response).to be_successful

    orders = JSON.parse(response.body)["data"]

    expect(orders.count).to eq(3)
  end

  it "can get one order by its id" do
    id = create(:order).id

    get "/api/v1/orders/#{id}"

    order = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(order["id"]).to eq(id.to_s)
  end

  # it "can create a new order" do
  #   order_params = { name: "Saw", description: "I want to play a game" }
  #
  #   post "/api/v1/orders", params: {order: order_params}
  #   order = Item.last
  #
  #   expect(response).to be_successful
  #   expect(order.name).to eq(order_params[:name])
  # end
  #
  # it "can update an existing order" do
  #   id = create(:order).id
  #   previous_name = Item.last.name
  #   order_params = { name: "Sledge" }
  #
  #   put "/api/v1/orders/#{id}", params: {order: order_params}
  #   order = Item.find_by(id: id)
  #
  #   expect(response).to be_successful
  #   expect(order.name).to_not eq(previous_name)
  #   expect(order.name).to eq("Sledge")
  # end
  #
  # it "can destroy an order" do
  #   order = create(:order)
  #
  #   expect(Item.count).to eq(1)
  #
  #   delete "/api/v1/orders/#{order.id}"
  #
  #   expect(response).to be_successful
  #   expect(Item.count).to eq(0)
  #   expect{Item.find(order.id)}.to raise_error(ActiveRecord::RecordNotFound)
  #
  #   order = create(:order)
  #
  #  expect{ delete "/api/v1/orders/#{order.id}" }.to change(Item, :count).by(-1)
  #
  #  expect(response).to be_success
  #  expect{Item.find(order.id)}.to raise_error(ActiveRecord::RecordNotFound)
  # end
end
