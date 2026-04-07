# frozen_string_literal: true

module Vapi
  module Types
    class BearerAuthenticationPlan < Internal::Types::Model
      field :token, -> { String }, optional: false, nullable: false
      field :header_name, -> { String }, optional: true, nullable: false, api_name: "headerName"
      field :bearer_prefix_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "bearerPrefixEnabled"
    end
  end
end
