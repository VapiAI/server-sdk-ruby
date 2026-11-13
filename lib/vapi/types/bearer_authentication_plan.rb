# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for authenticating outbound requests with a bearer token, including header name and optional
    # `Bearer` prefix.
    class BearerAuthenticationPlan < Internal::Types::Model
      field :token, -> { String }, optional: false, nullable: false
      field :header_name, -> { String }, optional: true, nullable: false, api_name: "headerName"
      field :bearer_prefix_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "bearerPrefixEnabled"
    end
  end
end
