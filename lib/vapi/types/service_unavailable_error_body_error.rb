# frozen_string_literal: true

module Vapi
  module Types
    class ServiceUnavailableErrorBodyError < Internal::Types::Model
      field :status_code, -> { Integer }, optional: false, nullable: false, api_name: "statusCode"
      field :message, -> { String }, optional: false, nullable: false
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
