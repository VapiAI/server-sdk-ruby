# frozen_string_literal: true

module Vapi
  module Types
    class Subscription < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :type, -> { Vapi::Types::SubscriptionType }, optional: false, nullable: false
      field :status, -> { Vapi::Types::SubscriptionStatus }, optional: false, nullable: false
      field :credits, -> { String }, optional: false, nullable: false
      field :concurrency_counter, -> { Integer }, optional: false, nullable: false, api_name: "concurrencyCounter"
      field :concurrency_limit_included, -> { Integer }, optional: false, nullable: false, api_name: "concurrencyLimitIncluded"
      field :phone_numbers_counter, -> { Integer }, optional: true, nullable: false, api_name: "phoneNumbersCounter"
      field :phone_numbers_included, -> { Integer }, optional: true, nullable: false, api_name: "phoneNumbersIncluded"
      field :concurrency_limit_purchased, -> { Integer }, optional: false, nullable: false, api_name: "concurrencyLimitPurchased"
      field :monthly_charge_schedule_id, -> { Integer }, optional: true, nullable: false, api_name: "monthlyChargeScheduleId"
      field :monthly_credit_check_schedule_id, -> { Integer }, optional: true, nullable: false, api_name: "monthlyCreditCheckScheduleId"
      field :stripe_customer_id, -> { String }, optional: true, nullable: false, api_name: "stripeCustomerId"
      field :stripe_payment_method_id, -> { String }, optional: true, nullable: false, api_name: "stripePaymentMethodId"
      field :slack_support_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "slackSupportEnabled"
      field :slack_channel_id, -> { String }, optional: true, nullable: false, api_name: "slackChannelId"
      field :hipaa_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hipaaEnabled"
      field :zdr_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "zdrEnabled"
      field :data_retention_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "dataRetentionEnabled"
      field :hipaa_common_paper_agreement_id, -> { String }, optional: true, nullable: false, api_name: "hipaaCommonPaperAgreementId"
      field :stripe_payment_method_fingerprint, -> { String }, optional: true, nullable: false, api_name: "stripePaymentMethodFingerprint"
      field :stripe_customer_email, -> { String }, optional: true, nullable: false, api_name: "stripeCustomerEmail"
      field :referred_by_email, -> { String }, optional: true, nullable: false, api_name: "referredByEmail"
      field :auto_reload_plan, -> { Vapi::Types::AutoReloadPlan }, optional: true, nullable: false, api_name: "autoReloadPlan"
      field :minutes_included, -> { Integer }, optional: true, nullable: false, api_name: "minutesIncluded"
      field :minutes_used, -> { Integer }, optional: true, nullable: false, api_name: "minutesUsed"
      field :minutes_used_next_reset_at, -> { String }, optional: true, nullable: false, api_name: "minutesUsedNextResetAt"
      field :minutes_overage_cost, -> { Integer }, optional: true, nullable: false, api_name: "minutesOverageCost"
      field :providers_included, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "providersIncluded"
      field :outbound_calls_daily_limit, -> { Integer }, optional: true, nullable: false, api_name: "outboundCallsDailyLimit"
      field :outbound_calls_counter, -> { Integer }, optional: true, nullable: false, api_name: "outboundCallsCounter"
      field :outbound_calls_counter_next_reset_at, -> { String }, optional: true, nullable: false, api_name: "outboundCallsCounterNextResetAt"
      field :coupon_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "couponIds"
      field :coupon_usage_left, -> { String }, optional: true, nullable: false, api_name: "couponUsageLeft"
      field :invoice_plan, -> { Vapi::Types::InvoicePlan }, optional: true, nullable: false, api_name: "invoicePlan"
      field :pci_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "pciEnabled"
      field :pci_common_paper_agreement_id, -> { String }, optional: true, nullable: false, api_name: "pciCommonPaperAgreementId"
      field :call_retention_days, -> { Integer }, optional: true, nullable: false, api_name: "callRetentionDays"
      field :chat_retention_days, -> { Integer }, optional: true, nullable: false, api_name: "chatRetentionDays"
      field :minutes_included_reset_frequency, -> { Vapi::Types::SubscriptionMinutesIncludedResetFrequency }, optional: true, nullable: false, api_name: "minutesIncludedResetFrequency"
      field :rbac_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "rbacEnabled"
      field :platform_fee, -> { Integer }, optional: true, nullable: false, api_name: "platformFee"
    end
  end
end
