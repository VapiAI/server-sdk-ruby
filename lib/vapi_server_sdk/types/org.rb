# frozen_string_literal: true
require_relative "subscription"
require "date"
require "date"
require "date"
require_relative "org_plan"
require_relative "org_channel"
require_relative "server"
require_relative "compliance_plan"
require "ostruct"
require "json"

module Vapi
  class Org
  # @return [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored. At
#  the end of the call, you will still receive an end-of-call-report message to
#  store on your server. Defaults to false.
#  When HIPAA is enabled, only OpenAI/Custom LLM or Azure Providers will be
#  available for LLM and Voice respectively.
#  This is due to the compliance requirements of HIPAA. Other providers may not
#  meet these requirements.
    attr_reader :hipaa_enabled
  # @return [Vapi::Subscription] 
    attr_reader :subscription
  # @return [String] This is the ID of the subscription the org belongs to.
    attr_reader :subscription_id
  # @return [String] This is the unique identifier for the org.
    attr_reader :id
  # @return [DateTime] This is the ISO 8601 date-time string of when the org was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the org was last updated.
    attr_reader :updated_at
  # @return [String] This is the Stripe customer for the org.
    attr_reader :stripe_customer_id
  # @return [String] This is the subscription for the org.
    attr_reader :stripe_subscription_id
  # @return [String] This is the subscription's subscription item.
    attr_reader :stripe_subscription_item_id
  # @return [DateTime] This is the subscription's current period start.
    attr_reader :stripe_subscription_current_period_start
  # @return [String] This is the subscription's status.
    attr_reader :stripe_subscription_status
  # @return [Vapi::OrgPlan] This is the plan for the org.
    attr_reader :plan
  # @return [String] This is the secret key used for signing JWT tokens for the org.
    attr_reader :jwt_secret
  # @return [Float] This is the total number of call minutes used by this org across all time.
    attr_reader :minutes_used
  # @return [String] This is the name of the org. This is just for your own reference.
    attr_reader :name
  # @return [Vapi::OrgChannel] This is the channel of the org. There is the cluster the API traffic for the org
#  will be directed.
    attr_reader :channel
  # @return [Float] This is the monthly billing limit for the org. To go beyond $1000/mo, please
#  contact us at support@vapi.ai.
    attr_reader :billing_limit
  # @return [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
#  with their shape in ServerMessage schema.
#  The order of precedence is:
#  1. assistant.server
#  2. phoneNumber.server
#  3. org.server
    attr_reader :server
  # @return [Float] This is the concurrency limit for the org. This is the maximum number of calls
#  that can be active at any given time. To go beyond 10, please contact us at
#  support@vapi.ai.
    attr_reader :concurrency_limit
  # @return [Vapi::CompliancePlan] Stores the information about the compliance plan enforced at the organization
#  level. Currently pciEnabled is supported through this field.
#  When this is enabled, any logs, recordings, or transcriptions will be shipped to
#  the customer endpoints if provided else lost.
#  At the end of the call, you will receive an end-of-call-report message to store
#  on your server, if webhook is provided.
#  Defaults to false.
#  When PCI is enabled, only PCI-compliant Providers will be available for LLM,
#  Voice and transcribers.
#  This is due to the compliance requirements of PCI. Other providers may not meet
#  these requirements.
    attr_reader :compliance_plan
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param hipaa_enabled [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored. At
#  the end of the call, you will still receive an end-of-call-report message to
#  store on your server. Defaults to false.
#  When HIPAA is enabled, only OpenAI/Custom LLM or Azure Providers will be
#  available for LLM and Voice respectively.
#  This is due to the compliance requirements of HIPAA. Other providers may not
#  meet these requirements.
    # @param subscription [Vapi::Subscription] 
    # @param subscription_id [String] This is the ID of the subscription the org belongs to.
    # @param id [String] This is the unique identifier for the org.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the org was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the org was last updated.
    # @param stripe_customer_id [String] This is the Stripe customer for the org.
    # @param stripe_subscription_id [String] This is the subscription for the org.
    # @param stripe_subscription_item_id [String] This is the subscription's subscription item.
    # @param stripe_subscription_current_period_start [DateTime] This is the subscription's current period start.
    # @param stripe_subscription_status [String] This is the subscription's status.
    # @param plan [Vapi::OrgPlan] This is the plan for the org.
    # @param jwt_secret [String] This is the secret key used for signing JWT tokens for the org.
    # @param minutes_used [Float] This is the total number of call minutes used by this org across all time.
    # @param name [String] This is the name of the org. This is just for your own reference.
    # @param channel [Vapi::OrgChannel] This is the channel of the org. There is the cluster the API traffic for the org
#  will be directed.
    # @param billing_limit [Float] This is the monthly billing limit for the org. To go beyond $1000/mo, please
#  contact us at support@vapi.ai.
    # @param server [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
#  with their shape in ServerMessage schema.
#  The order of precedence is:
#  1. assistant.server
#  2. phoneNumber.server
#  3. org.server
    # @param concurrency_limit [Float] This is the concurrency limit for the org. This is the maximum number of calls
#  that can be active at any given time. To go beyond 10, please contact us at
#  support@vapi.ai.
    # @param compliance_plan [Vapi::CompliancePlan] Stores the information about the compliance plan enforced at the organization
#  level. Currently pciEnabled is supported through this field.
#  When this is enabled, any logs, recordings, or transcriptions will be shipped to
#  the customer endpoints if provided else lost.
#  At the end of the call, you will receive an end-of-call-report message to store
#  on your server, if webhook is provided.
#  Defaults to false.
#  When PCI is enabled, only PCI-compliant Providers will be available for LLM,
#  Voice and transcribers.
#  This is due to the compliance requirements of PCI. Other providers may not meet
#  these requirements.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Org]
    def initialize(hipaa_enabled: OMIT, subscription: OMIT, subscription_id: OMIT, id:, created_at:, updated_at:, stripe_customer_id: OMIT, stripe_subscription_id: OMIT, stripe_subscription_item_id: OMIT, stripe_subscription_current_period_start: OMIT, stripe_subscription_status: OMIT, plan: OMIT, jwt_secret: OMIT, minutes_used: OMIT, name: OMIT, channel: OMIT, billing_limit: OMIT, server: OMIT, concurrency_limit: OMIT, compliance_plan: OMIT, additional_properties: nil)
      @hipaa_enabled = hipaa_enabled if hipaa_enabled != OMIT
      @subscription = subscription if subscription != OMIT
      @subscription_id = subscription_id if subscription_id != OMIT
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @stripe_customer_id = stripe_customer_id if stripe_customer_id != OMIT
      @stripe_subscription_id = stripe_subscription_id if stripe_subscription_id != OMIT
      @stripe_subscription_item_id = stripe_subscription_item_id if stripe_subscription_item_id != OMIT
      @stripe_subscription_current_period_start = stripe_subscription_current_period_start if stripe_subscription_current_period_start != OMIT
      @stripe_subscription_status = stripe_subscription_status if stripe_subscription_status != OMIT
      @plan = plan if plan != OMIT
      @jwt_secret = jwt_secret if jwt_secret != OMIT
      @minutes_used = minutes_used if minutes_used != OMIT
      @name = name if name != OMIT
      @channel = channel if channel != OMIT
      @billing_limit = billing_limit if billing_limit != OMIT
      @server = server if server != OMIT
      @concurrency_limit = concurrency_limit if concurrency_limit != OMIT
      @compliance_plan = compliance_plan if compliance_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "hipaaEnabled": hipaa_enabled, "subscription": subscription, "subscriptionId": subscription_id, "id": id, "createdAt": created_at, "updatedAt": updated_at, "stripeCustomerId": stripe_customer_id, "stripeSubscriptionId": stripe_subscription_id, "stripeSubscriptionItemId": stripe_subscription_item_id, "stripeSubscriptionCurrentPeriodStart": stripe_subscription_current_period_start, "stripeSubscriptionStatus": stripe_subscription_status, "plan": plan, "jwtSecret": jwt_secret, "minutesUsed": minutes_used, "name": name, "channel": channel, "billingLimit": billing_limit, "server": server, "concurrencyLimit": concurrency_limit, "compliancePlan": compliance_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Org
    #
    # @param json_object [String] 
    # @return [Vapi::Org]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      hipaa_enabled = parsed_json["hipaaEnabled"]
      unless parsed_json["subscription"].nil?
        subscription = parsed_json["subscription"].to_json
        subscription = Vapi::Subscription.from_json(json_object: subscription)
      else
        subscription = nil
      end
      subscription_id = parsed_json["subscriptionId"]
      id = parsed_json["id"]
      created_at = unless parsed_json["createdAt"].nil?
  DateTime.parse(parsed_json["createdAt"])
else
  nil
end
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
end
      stripe_customer_id = parsed_json["stripeCustomerId"]
      stripe_subscription_id = parsed_json["stripeSubscriptionId"]
      stripe_subscription_item_id = parsed_json["stripeSubscriptionItemId"]
      stripe_subscription_current_period_start = unless parsed_json["stripeSubscriptionCurrentPeriodStart"].nil?
  DateTime.parse(parsed_json["stripeSubscriptionCurrentPeriodStart"])
else
  nil
end
      stripe_subscription_status = parsed_json["stripeSubscriptionStatus"]
      unless parsed_json["plan"].nil?
        plan = parsed_json["plan"].to_json
        plan = Vapi::OrgPlan.from_json(json_object: plan)
      else
        plan = nil
      end
      jwt_secret = parsed_json["jwtSecret"]
      minutes_used = parsed_json["minutesUsed"]
      name = parsed_json["name"]
      channel = parsed_json["channel"]
      billing_limit = parsed_json["billingLimit"]
      unless parsed_json["server"].nil?
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      else
        server = nil
      end
      concurrency_limit = parsed_json["concurrencyLimit"]
      unless parsed_json["compliancePlan"].nil?
        compliance_plan = parsed_json["compliancePlan"].to_json
        compliance_plan = Vapi::CompliancePlan.from_json(json_object: compliance_plan)
      else
        compliance_plan = nil
      end
      new(
        hipaa_enabled: hipaa_enabled,
        subscription: subscription,
        subscription_id: subscription_id,
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        stripe_customer_id: stripe_customer_id,
        stripe_subscription_id: stripe_subscription_id,
        stripe_subscription_item_id: stripe_subscription_item_id,
        stripe_subscription_current_period_start: stripe_subscription_current_period_start,
        stripe_subscription_status: stripe_subscription_status,
        plan: plan,
        jwt_secret: jwt_secret,
        minutes_used: minutes_used,
        name: name,
        channel: channel,
        billing_limit: billing_limit,
        server: server,
        concurrency_limit: concurrency_limit,
        compliance_plan: compliance_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of Org to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_enabled is not the expected type, validation failed.")
      obj.subscription.nil? || Vapi::Subscription.validate_raw(obj: obj.subscription)
      obj.subscription_id&.is_a?(String) != false || raise("Passed value for field obj.subscription_id is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.stripe_customer_id&.is_a?(String) != false || raise("Passed value for field obj.stripe_customer_id is not the expected type, validation failed.")
      obj.stripe_subscription_id&.is_a?(String) != false || raise("Passed value for field obj.stripe_subscription_id is not the expected type, validation failed.")
      obj.stripe_subscription_item_id&.is_a?(String) != false || raise("Passed value for field obj.stripe_subscription_item_id is not the expected type, validation failed.")
      obj.stripe_subscription_current_period_start&.is_a?(DateTime) != false || raise("Passed value for field obj.stripe_subscription_current_period_start is not the expected type, validation failed.")
      obj.stripe_subscription_status&.is_a?(String) != false || raise("Passed value for field obj.stripe_subscription_status is not the expected type, validation failed.")
      obj.plan.nil? || Vapi::OrgPlan.validate_raw(obj: obj.plan)
      obj.jwt_secret&.is_a?(String) != false || raise("Passed value for field obj.jwt_secret is not the expected type, validation failed.")
      obj.minutes_used&.is_a?(Float) != false || raise("Passed value for field obj.minutes_used is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.channel&.is_a?(Vapi::OrgChannel) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
      obj.billing_limit&.is_a?(Float) != false || raise("Passed value for field obj.billing_limit is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.concurrency_limit&.is_a?(Float) != false || raise("Passed value for field obj.concurrency_limit is not the expected type, validation failed.")
      obj.compliance_plan.nil? || Vapi::CompliancePlan.validate_raw(obj: obj.compliance_plan)
    end
  end
end