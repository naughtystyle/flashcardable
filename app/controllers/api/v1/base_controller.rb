module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActionController::ParameterMissing, with: :missing_param_error

      private

      def not_found
        render json: {
          errors: {
            title: "RecordNotFound",
            detail: "Record not found."
          }
        }, status: :not_found
      end

      def missing_param_error(exception)
        render json: {
          errors: {
            title: "UnprocessableEntity",
            detail: exception.message
          }
        }, status: :unprocessable_entity
      end
    end
  end
end
