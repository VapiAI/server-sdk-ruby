# frozen_string_literal: true

module Vapi
  module Types
    class Org < Internal::Types::Model
      field :hipaa_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hipaaEnabled"
      field :subscription, -> { Vapi::Types::Subscription }, optional: true, nullable: false
      field :subscription_id, -> { String }, optional: true, nullable: false, api_name: "subscriptionId"
      field :id, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :stripe_subscription_id, -> { String }, optional: true, nullable: false, api_name: "stripeSubscriptionId"
      field :stripe_subscription_item_id, -> { String }, optional: true, nullable: false, api_name: "stripeSubscriptionItemId"
      field :stripe_subscription_current_period_start, -> { String }, optional: true, nullable: false, api_name: "stripeSubscriptionCurrentPeriodStart"
      field :stripe_subscription_status, -> { String }, optional: true, nullable: false, api_name: "stripeSubscriptionStatus"
      field :jwt_secret, -> { String }, optional: true, nullable: false, api_name: "jwtSecret"
      field :minutes_used, -> { Integer }, optional: true, nullable: false, api_name: "minutesUsed"
      field :name, -> { String }, optional: true, nullable: false
      field :channel, -> { Vapi::Types::OrgChannel }, optional: true, nullable: false
      field :billing_limit, -> { Integer }, optional: true, nullable: false, api_name: "billingLimit"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :concurrency_limit, -> { Integer }, optional: true, nullable: false, api_name: "concurrencyLimit"
      field :compliance_plan, -> { Vapi::Types::CompliancePlan }, optional: true, nullable: false, api_name: "compliancePlan"
    end
  end
end
