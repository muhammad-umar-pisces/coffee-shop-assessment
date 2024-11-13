# app/controllers/api/v1/items_controller.rb
module Api
  module V1
    class ItemsController < BaseController
      # GET /api/v1/items
      def index
        items = Item.available
        render_success(items)
      end
    end
  end
end
