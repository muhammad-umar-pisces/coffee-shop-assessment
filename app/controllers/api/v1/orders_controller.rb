module Api
  module V1
    class OrdersController < BaseController
      def create
        order = Order.new(order_params)

        calculate_total_amount(order)

        if order.save
          render_success( { order: order, items: order.order_items })
        else
          render_error(order.errors.full_messages.to_sentence, :unprocessable_entity)
        end
      end

      private

      def order_params
        params.require(:order).permit(:customer_id, order_items_attributes: [:item_id, :quantity, :price_at_order])
      end

      def calculate_total_amount(order)
        total = 0
        order.order_items.each do |order_item|
          total += order_item.price_at_order * order_item.quantity
        end
        order.total_amount = total
      end
    end
  end
end
