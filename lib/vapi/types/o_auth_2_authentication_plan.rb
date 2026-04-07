# frozen_string_literal: true

module Vapi
  module Types
    class OAuth2AuthenticationPlan < Internal::Types::Model
      field :type, -> { Vapi::Types::OAuth2AuthenticationPlanType }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :client_id, -> { String }, optional: false, nullable: false, api_name: "clientId"
      field :client_secret, -> { String }, optional: false, nullable: false, api_name: "clientSecret"
      field :scope, -> { String }, optional: true, nullable: false
    end
  end
end
