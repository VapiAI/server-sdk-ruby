# frozen_string_literal: true

module Vapi
  module Types
    class CreateOrgDto < Internal::Types::Model
      field :hipaa_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hipaaEnabled"
      field :subscription_id, -> { String }, optional: true, nullable: false, api_name: "subscriptionId"
      field :name, -> { String }, optional: true, nullable: false
      field :channel, -> { Vapi::Types::CreateOrgDtoChannel }, optional: true, nullable: false
      field :billing_limit, -> { Integer }, optional: true, nullable: false, api_name: "billingLimit"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :concurrency_limit, -> { Integer }, optional: true, nullable: false, api_name: "concurrencyLimit"
      field :compliance_plan, -> { Vapi::Types::CompliancePlan }, optional: true, nullable: false, api_name: "compliancePlan"
    end
  end
end
