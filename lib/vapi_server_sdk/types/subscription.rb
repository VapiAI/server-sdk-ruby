# frozen_string_literal: true

require "date"
require_relative "subscription_type"
require_relative "subscription_status"
require_relative "auto_reload_plan"
require "ostruct"
require "json"

module Vapi
  class Subscription
    # @return [String] This is the unique identifier for the subscription.
    attr_reader :id
    # @return [DateTime] This is the timestamp when the subscription was created.
    attr_reader :created_at
    # @return [DateTime] This is the timestamp when the subscription was last updated.
    attr_reader :updated_at
    # @return [Vapi::SubscriptionType] This is the type / tier of the subscription.
    attr_reader :type
    # @return [Vapi::SubscriptionStatus] This is the status of the subscription. Past due subscriptions are subscriptions
    #  with past due payments.
    attr_reader :status
    # @return [String] This is the number of credits the subscription currently has.
    #  Note: This is a string to avoid floating point precision issues.
    attr_reader :credits
    # @return [Float] This is the total number of active calls (concurrency) across all orgs under
    #  this subscription.
    attr_reader :concurrency_counter
    # @return [Float] This is the default concurrency limit for the subscription.
    attr_reader :concurrency_limit_included
    # @return [Float] This is the purchased add-on concurrency limit for the subscription.
    attr_reader :concurrency_limit_purchased
    # @return [Float] This is the ID of the monthly job that charges for subscription add ons and
    #  phone numbers.
    attr_reader :monthly_charge_schedule_id
    # @return [Float] This is the ID of the monthly job that checks whether the credit balance of the
    #  subscription
    #  is sufficient for the monthly charge.
    attr_reader :monthly_credit_check_schedule_id
    # @return [String] This is the Stripe customer ID.
    attr_reader :stripe_customer_id
    # @return [String] This is the Stripe payment ID.
    attr_reader :stripe_payment_method_id
    # @return [Boolean] If this flag is true, then the user has purchased slack support.
    attr_reader :slack_support_enabled
    # @return [String] If this subscription has a slack support subscription, the slack channel's ID
    #  will be stored here.
    attr_reader :slack_channel_id
    # @return [Boolean] This is the HIPAA enabled flag for the subscription. It determines whether orgs
    #  under this
    #  subscription have the option to enable HIPAA compliance.
    attr_reader :hipaa_enabled
    # @return [String] This is the ID for the Common Paper agreement outlining the HIPAA contract.
    attr_reader :hipaa_common_paper_agreement_id
    # @return [String] This is the Stripe fingerprint of the payment method (card). It allows us
    #  to detect users who try to abuse our system through multiple sign-ups.
    attr_reader :stripe_payment_method_fingerprint
    # @return [String] This is the customer's email on Stripe.
    attr_reader :stripe_customer_email
    # @return [String] This is the email of the referrer for the subscription.
    attr_reader :referred_by_email
    # @return [Vapi::AutoReloadPlan] This is the auto reload plan configured for the subscription.
    attr_reader :auto_reload_plan
    # @return [Float] The number of minutes included in the subscription. Enterprise only.
    attr_reader :minutes_included
    # @return [Float] The number of minutes used in the subscription. Enterprise only.
    attr_reader :minutes_used
    # @return [Float] The per minute charge on minutes that exceed the included minutes. Enterprise
    #  only.
    attr_reader :minutes_overage_cost
    # @return [Array<String>] The list of providers included in the subscription. Enterprise only.
    attr_reader :providers_included
    # @return [Float] The maximum number of outbound calls this subscription may make in a day. Resets
    #  every night.
    attr_reader :outbound_calls_daily_limit
    # @return [Float] The current number of outbound calls the subscription has made in the current
    #  day.
    attr_reader :outbound_calls_counter
    # @return [DateTime] This is the timestamp at which the outbound calls counter is scheduled to reset
    #  at.
    attr_reader :outbound_calls_counter_next_reset_at
    # @return [Array<String>] This is the IDs of the coupons applicable to this subscription.
    attr_reader :coupon_ids
    # @return [String] This is the number of credits left obtained from a coupon.
    attr_reader :coupon_usage_left
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the unique identifier for the subscription.
    # @param created_at [DateTime] This is the timestamp when the subscription was created.
    # @param updated_at [DateTime] This is the timestamp when the subscription was last updated.
    # @param type [Vapi::SubscriptionType] This is the type / tier of the subscription.
    # @param status [Vapi::SubscriptionStatus] This is the status of the subscription. Past due subscriptions are subscriptions
    #  with past due payments.
    # @param credits [String] This is the number of credits the subscription currently has.
    #  Note: This is a string to avoid floating point precision issues.
    # @param concurrency_counter [Float] This is the total number of active calls (concurrency) across all orgs under
    #  this subscription.
    # @param concurrency_limit_included [Float] This is the default concurrency limit for the subscription.
    # @param concurrency_limit_purchased [Float] This is the purchased add-on concurrency limit for the subscription.
    # @param monthly_charge_schedule_id [Float] This is the ID of the monthly job that charges for subscription add ons and
    #  phone numbers.
    # @param monthly_credit_check_schedule_id [Float] This is the ID of the monthly job that checks whether the credit balance of the
    #  subscription
    #  is sufficient for the monthly charge.
    # @param stripe_customer_id [String] This is the Stripe customer ID.
    # @param stripe_payment_method_id [String] This is the Stripe payment ID.
    # @param slack_support_enabled [Boolean] If this flag is true, then the user has purchased slack support.
    # @param slack_channel_id [String] If this subscription has a slack support subscription, the slack channel's ID
    #  will be stored here.
    # @param hipaa_enabled [Boolean] This is the HIPAA enabled flag for the subscription. It determines whether orgs
    #  under this
    #  subscription have the option to enable HIPAA compliance.
    # @param hipaa_common_paper_agreement_id [String] This is the ID for the Common Paper agreement outlining the HIPAA contract.
    # @param stripe_payment_method_fingerprint [String] This is the Stripe fingerprint of the payment method (card). It allows us
    #  to detect users who try to abuse our system through multiple sign-ups.
    # @param stripe_customer_email [String] This is the customer's email on Stripe.
    # @param referred_by_email [String] This is the email of the referrer for the subscription.
    # @param auto_reload_plan [Vapi::AutoReloadPlan] This is the auto reload plan configured for the subscription.
    # @param minutes_included [Float] The number of minutes included in the subscription. Enterprise only.
    # @param minutes_used [Float] The number of minutes used in the subscription. Enterprise only.
    # @param minutes_overage_cost [Float] The per minute charge on minutes that exceed the included minutes. Enterprise
    #  only.
    # @param providers_included [Array<String>] The list of providers included in the subscription. Enterprise only.
    # @param outbound_calls_daily_limit [Float] The maximum number of outbound calls this subscription may make in a day. Resets
    #  every night.
    # @param outbound_calls_counter [Float] The current number of outbound calls the subscription has made in the current
    #  day.
    # @param outbound_calls_counter_next_reset_at [DateTime] This is the timestamp at which the outbound calls counter is scheduled to reset
    #  at.
    # @param coupon_ids [Array<String>] This is the IDs of the coupons applicable to this subscription.
    # @param coupon_usage_left [String] This is the number of credits left obtained from a coupon.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Subscription]
    def initialize(id:, created_at:, updated_at:, type:, status:, credits:, concurrency_counter:,
                   concurrency_limit_included:, concurrency_limit_purchased:, monthly_charge_schedule_id: OMIT, monthly_credit_check_schedule_id: OMIT, stripe_customer_id: OMIT, stripe_payment_method_id: OMIT, slack_support_enabled: OMIT, slack_channel_id: OMIT, hipaa_enabled: OMIT, hipaa_common_paper_agreement_id: OMIT, stripe_payment_method_fingerprint: OMIT, stripe_customer_email: OMIT, referred_by_email: OMIT, auto_reload_plan: OMIT, minutes_included: OMIT, minutes_used: OMIT, minutes_overage_cost: OMIT, providers_included: OMIT, outbound_calls_daily_limit: OMIT, outbound_calls_counter: OMIT, outbound_calls_counter_next_reset_at: OMIT, coupon_ids: OMIT, coupon_usage_left: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @type = type
      @status = status
      @credits = credits
      @concurrency_counter = concurrency_counter
      @concurrency_limit_included = concurrency_limit_included
      @concurrency_limit_purchased = concurrency_limit_purchased
      @monthly_charge_schedule_id = monthly_charge_schedule_id if monthly_charge_schedule_id != OMIT
      @monthly_credit_check_schedule_id = monthly_credit_check_schedule_id if monthly_credit_check_schedule_id != OMIT
      @stripe_customer_id = stripe_customer_id if stripe_customer_id != OMIT
      @stripe_payment_method_id = stripe_payment_method_id if stripe_payment_method_id != OMIT
      @slack_support_enabled = slack_support_enabled if slack_support_enabled != OMIT
      @slack_channel_id = slack_channel_id if slack_channel_id != OMIT
      @hipaa_enabled = hipaa_enabled if hipaa_enabled != OMIT
      @hipaa_common_paper_agreement_id = hipaa_common_paper_agreement_id if hipaa_common_paper_agreement_id != OMIT
      if stripe_payment_method_fingerprint != OMIT
        @stripe_payment_method_fingerprint = stripe_payment_method_fingerprint
      end
      @stripe_customer_email = stripe_customer_email if stripe_customer_email != OMIT
      @referred_by_email = referred_by_email if referred_by_email != OMIT
      @auto_reload_plan = auto_reload_plan if auto_reload_plan != OMIT
      @minutes_included = minutes_included if minutes_included != OMIT
      @minutes_used = minutes_used if minutes_used != OMIT
      @minutes_overage_cost = minutes_overage_cost if minutes_overage_cost != OMIT
      @providers_included = providers_included if providers_included != OMIT
      @outbound_calls_daily_limit = outbound_calls_daily_limit if outbound_calls_daily_limit != OMIT
      @outbound_calls_counter = outbound_calls_counter if outbound_calls_counter != OMIT
      if outbound_calls_counter_next_reset_at != OMIT
        @outbound_calls_counter_next_reset_at = outbound_calls_counter_next_reset_at
      end
      @coupon_ids = coupon_ids if coupon_ids != OMIT
      @coupon_usage_left = coupon_usage_left if coupon_usage_left != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "type": type,
        "status": status,
        "credits": credits,
        "concurrencyCounter": concurrency_counter,
        "concurrencyLimitIncluded": concurrency_limit_included,
        "concurrencyLimitPurchased": concurrency_limit_purchased,
        "monthlyChargeScheduleId": monthly_charge_schedule_id,
        "monthlyCreditCheckScheduleId": monthly_credit_check_schedule_id,
        "stripeCustomerId": stripe_customer_id,
        "stripePaymentMethodId": stripe_payment_method_id,
        "slackSupportEnabled": slack_support_enabled,
        "slackChannelId": slack_channel_id,
        "hipaaEnabled": hipaa_enabled,
        "hipaaCommonPaperAgreementId": hipaa_common_paper_agreement_id,
        "stripePaymentMethodFingerprint": stripe_payment_method_fingerprint,
        "stripeCustomerEmail": stripe_customer_email,
        "referredByEmail": referred_by_email,
        "autoReloadPlan": auto_reload_plan,
        "minutesIncluded": minutes_included,
        "minutesUsed": minutes_used,
        "minutesOverageCost": minutes_overage_cost,
        "providersIncluded": providers_included,
        "outboundCallsDailyLimit": outbound_calls_daily_limit,
        "outboundCallsCounter": outbound_calls_counter,
        "outboundCallsCounterNextResetAt": outbound_calls_counter_next_reset_at,
        "couponIds": coupon_ids,
        "couponUsageLeft": coupon_usage_left
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Subscription
    #
    # @param json_object [String]
    # @return [Vapi::Subscription]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      type = parsed_json["type"]
      status = parsed_json["status"]
      credits = parsed_json["credits"]
      concurrency_counter = parsed_json["concurrencyCounter"]
      concurrency_limit_included = parsed_json["concurrencyLimitIncluded"]
      concurrency_limit_purchased = parsed_json["concurrencyLimitPurchased"]
      monthly_charge_schedule_id = parsed_json["monthlyChargeScheduleId"]
      monthly_credit_check_schedule_id = parsed_json["monthlyCreditCheckScheduleId"]
      stripe_customer_id = parsed_json["stripeCustomerId"]
      stripe_payment_method_id = parsed_json["stripePaymentMethodId"]
      slack_support_enabled = parsed_json["slackSupportEnabled"]
      slack_channel_id = parsed_json["slackChannelId"]
      hipaa_enabled = parsed_json["hipaaEnabled"]
      hipaa_common_paper_agreement_id = parsed_json["hipaaCommonPaperAgreementId"]
      stripe_payment_method_fingerprint = parsed_json["stripePaymentMethodFingerprint"]
      stripe_customer_email = parsed_json["stripeCustomerEmail"]
      referred_by_email = parsed_json["referredByEmail"]
      if parsed_json["autoReloadPlan"].nil?
        auto_reload_plan = nil
      else
        auto_reload_plan = parsed_json["autoReloadPlan"].to_json
        auto_reload_plan = Vapi::AutoReloadPlan.from_json(json_object: auto_reload_plan)
      end
      minutes_included = parsed_json["minutesIncluded"]
      minutes_used = parsed_json["minutesUsed"]
      minutes_overage_cost = parsed_json["minutesOverageCost"]
      providers_included = parsed_json["providersIncluded"]
      outbound_calls_daily_limit = parsed_json["outboundCallsDailyLimit"]
      outbound_calls_counter = parsed_json["outboundCallsCounter"]
      outbound_calls_counter_next_reset_at = unless parsed_json["outboundCallsCounterNextResetAt"].nil?
                                               DateTime.parse(parsed_json["outboundCallsCounterNextResetAt"])
                                             end
      coupon_ids = parsed_json["couponIds"]
      coupon_usage_left = parsed_json["couponUsageLeft"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        type: type,
        status: status,
        credits: credits,
        concurrency_counter: concurrency_counter,
        concurrency_limit_included: concurrency_limit_included,
        concurrency_limit_purchased: concurrency_limit_purchased,
        monthly_charge_schedule_id: monthly_charge_schedule_id,
        monthly_credit_check_schedule_id: monthly_credit_check_schedule_id,
        stripe_customer_id: stripe_customer_id,
        stripe_payment_method_id: stripe_payment_method_id,
        slack_support_enabled: slack_support_enabled,
        slack_channel_id: slack_channel_id,
        hipaa_enabled: hipaa_enabled,
        hipaa_common_paper_agreement_id: hipaa_common_paper_agreement_id,
        stripe_payment_method_fingerprint: stripe_payment_method_fingerprint,
        stripe_customer_email: stripe_customer_email,
        referred_by_email: referred_by_email,
        auto_reload_plan: auto_reload_plan,
        minutes_included: minutes_included,
        minutes_used: minutes_used,
        minutes_overage_cost: minutes_overage_cost,
        providers_included: providers_included,
        outbound_calls_daily_limit: outbound_calls_daily_limit,
        outbound_calls_counter: outbound_calls_counter,
        outbound_calls_counter_next_reset_at: outbound_calls_counter_next_reset_at,
        coupon_ids: coupon_ids,
        coupon_usage_left: coupon_usage_left,
        additional_properties: struct
      )
    end

    # Serialize an instance of Subscription to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::SubscriptionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.status.is_a?(Vapi::SubscriptionStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.credits.is_a?(String) != false || raise("Passed value for field obj.credits is not the expected type, validation failed.")
      obj.concurrency_counter.is_a?(Float) != false || raise("Passed value for field obj.concurrency_counter is not the expected type, validation failed.")
      obj.concurrency_limit_included.is_a?(Float) != false || raise("Passed value for field obj.concurrency_limit_included is not the expected type, validation failed.")
      obj.concurrency_limit_purchased.is_a?(Float) != false || raise("Passed value for field obj.concurrency_limit_purchased is not the expected type, validation failed.")
      obj.monthly_charge_schedule_id&.is_a?(Float) != false || raise("Passed value for field obj.monthly_charge_schedule_id is not the expected type, validation failed.")
      obj.monthly_credit_check_schedule_id&.is_a?(Float) != false || raise("Passed value for field obj.monthly_credit_check_schedule_id is not the expected type, validation failed.")
      obj.stripe_customer_id&.is_a?(String) != false || raise("Passed value for field obj.stripe_customer_id is not the expected type, validation failed.")
      obj.stripe_payment_method_id&.is_a?(String) != false || raise("Passed value for field obj.stripe_payment_method_id is not the expected type, validation failed.")
      obj.slack_support_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.slack_support_enabled is not the expected type, validation failed.")
      obj.slack_channel_id&.is_a?(String) != false || raise("Passed value for field obj.slack_channel_id is not the expected type, validation failed.")
      obj.hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_enabled is not the expected type, validation failed.")
      obj.hipaa_common_paper_agreement_id&.is_a?(String) != false || raise("Passed value for field obj.hipaa_common_paper_agreement_id is not the expected type, validation failed.")
      obj.stripe_payment_method_fingerprint&.is_a?(String) != false || raise("Passed value for field obj.stripe_payment_method_fingerprint is not the expected type, validation failed.")
      obj.stripe_customer_email&.is_a?(String) != false || raise("Passed value for field obj.stripe_customer_email is not the expected type, validation failed.")
      obj.referred_by_email&.is_a?(String) != false || raise("Passed value for field obj.referred_by_email is not the expected type, validation failed.")
      obj.auto_reload_plan.nil? || Vapi::AutoReloadPlan.validate_raw(obj: obj.auto_reload_plan)
      obj.minutes_included&.is_a?(Float) != false || raise("Passed value for field obj.minutes_included is not the expected type, validation failed.")
      obj.minutes_used&.is_a?(Float) != false || raise("Passed value for field obj.minutes_used is not the expected type, validation failed.")
      obj.minutes_overage_cost&.is_a?(Float) != false || raise("Passed value for field obj.minutes_overage_cost is not the expected type, validation failed.")
      obj.providers_included&.is_a?(Array) != false || raise("Passed value for field obj.providers_included is not the expected type, validation failed.")
      obj.outbound_calls_daily_limit&.is_a?(Float) != false || raise("Passed value for field obj.outbound_calls_daily_limit is not the expected type, validation failed.")
      obj.outbound_calls_counter&.is_a?(Float) != false || raise("Passed value for field obj.outbound_calls_counter is not the expected type, validation failed.")
      obj.outbound_calls_counter_next_reset_at&.is_a?(DateTime) != false || raise("Passed value for field obj.outbound_calls_counter_next_reset_at is not the expected type, validation failed.")
      obj.coupon_ids&.is_a?(Array) != false || raise("Passed value for field obj.coupon_ids is not the expected type, validation failed.")
      obj.coupon_usage_left&.is_a?(String) != false || raise("Passed value for field obj.coupon_usage_left is not the expected type, validation failed.")
    end
  end
end
