module Api
  module V1
    class BaseController < ApplicationController
      before_action :set_default_response_format

      def set_default_response_format
        request.format = :json
      end

      def render_success(data = {}, message = 'Request successful', status = :ok)
        render json: { success: true, message: message, data: data }, status: status
      end

      def render_error(message = 'Something went wrong', status = :unprocessable_entity)
        render json: { success: false, message: message }, status: status
      end
    end
  end
end
