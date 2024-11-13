# app/controllers/api/v1/base_controller.rb
module Api
  module V1
    class BaseController < ApplicationController
      # If you need to ensure the response format is JSON, add this line:
      before_action :set_default_response_format

      # You can include authentication, error handling, or other shared functionality here
      # For example, if you're using Devise or JWT for authentication, you can add logic for that

      # Set response format to JSON by default
      def set_default_response_format
        request.format = :json
      end

      # You can define shared response methods
      def render_success(data = {}, message = 'Request successful', status = :ok)
        render json: { success: true, message: message, data: data }, status: status
      end

      def render_error(message = 'Something went wrong', status = :unprocessable_entity)
        render json: { success: false, message: message }, status: status
      end
    end
  end
end
