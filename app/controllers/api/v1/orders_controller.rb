module Api
  module V1
    class OrdersController < BaseController
      def create
        order = Order.new(order_params)

        calculate_total_amount(order)

        if order.save
          OrderCompletionJob.set(wait: 1.minutes).perform_later(order.id)

          render_success( { order: order, items: order.order_items })
        else
          render_error(order.errors.full_messages.to_sentence, :unprocessable_entity)
        end
      end

      def update
        order = Order.find_by(id: params[:id])
        if order.nil?
          render_error('Order not found', :not_found) and return
        end

        if order.update(order_params)
          if order.completed?
            # Simulate notifying the customer (this can be expanded to actual notifications, e.g., email)
            notify_customer(order)
          end
          render_success({ order: order, items: order.order_items }, 'Order updated successfully')
        else
          render_error(order.errors.full_messages.to_sentence)
        end
      end

      private

      def order_params
        params.require(:order).permit(:status, :customer_id, order_items_attributes: [:item_id, :quantity, :price_at_order])
      end

      def notify_customer(order)
        order.notifications.create(message: "Your order ##{order.id} is ready for pickup!")
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
