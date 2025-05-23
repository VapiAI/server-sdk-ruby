# frozen_string_literal: true

require_relative "update_org_dto_channel"
require_relative "server"
require_relative "compliance_plan"
require "ostruct"
require "json"

module Vapi
  class UpdateOrgDto
    # @return [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored. At
    #  the end of the call, you will still receive an end-of-call-report message to
    #  store on your server. Defaults to false.
    #  When HIPAA is enabled, only OpenAI/Custom LLM or Azure Providers will be
    #  available for LLM and Voice respectively.
    #  This is due to the compliance requirements of HIPAA. Other providers may not
    #  meet these requirements.
    attr_reader :hipaa_enabled
    # @return [String] This is the ID of the subscription the org belongs to.
    attr_reader :subscription_id
    # @return [String] This is the name of the org. This is just for your own reference.
    attr_reader :name
    # @return [Vapi::UpdateOrgDtoChannel] This is the channel of the org. There is the cluster the API traffic for the org
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
    # @param subscription_id [String] This is the ID of the subscription the org belongs to.
    # @param name [String] This is the name of the org. This is just for your own reference.
    # @param channel [Vapi::UpdateOrgDtoChannel] This is the channel of the org. There is the cluster the API traffic for the org
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
    # @return [Vapi::UpdateOrgDto]
    def initialize(hipaa_enabled: OMIT, subscription_id: OMIT, name: OMIT, channel: OMIT, billing_limit: OMIT,
                   server: OMIT, concurrency_limit: OMIT, compliance_plan: OMIT, additional_properties: nil)
      @hipaa_enabled = hipaa_enabled if hipaa_enabled != OMIT
      @subscription_id = subscription_id if subscription_id != OMIT
      @name = name if name != OMIT
      @channel = channel if channel != OMIT
      @billing_limit = billing_limit if billing_limit != OMIT
      @server = server if server != OMIT
      @concurrency_limit = concurrency_limit if concurrency_limit != OMIT
      @compliance_plan = compliance_plan if compliance_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "hipaaEnabled": hipaa_enabled,
        "subscriptionId": subscription_id,
        "name": name,
        "channel": channel,
        "billingLimit": billing_limit,
        "server": server,
        "concurrencyLimit": concurrency_limit,
        "compliancePlan": compliance_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateOrgDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateOrgDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      hipaa_enabled = parsed_json["hipaaEnabled"]
      subscription_id = parsed_json["subscriptionId"]
      name = parsed_json["name"]
      channel = parsed_json["channel"]
      billing_limit = parsed_json["billingLimit"]
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      concurrency_limit = parsed_json["concurrencyLimit"]
      if parsed_json["compliancePlan"].nil?
        compliance_plan = nil
      else
        compliance_plan = parsed_json["compliancePlan"].to_json
        compliance_plan = Vapi::CompliancePlan.from_json(json_object: compliance_plan)
      end
      new(
        hipaa_enabled: hipaa_enabled,
        subscription_id: subscription_id,
        name: name,
        channel: channel,
        billing_limit: billing_limit,
        server: server,
        concurrency_limit: concurrency_limit,
        compliance_plan: compliance_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateOrgDto to a JSON object
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
      obj.hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_enabled is not the expected type, validation failed.")
      obj.subscription_id&.is_a?(String) != false || raise("Passed value for field obj.subscription_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.channel&.is_a?(Vapi::UpdateOrgDtoChannel) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
      obj.billing_limit&.is_a?(Float) != false || raise("Passed value for field obj.billing_limit is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.concurrency_limit&.is_a?(Float) != false || raise("Passed value for field obj.concurrency_limit is not the expected type, validation failed.")
      obj.compliance_plan.nil? || Vapi::CompliancePlan.validate_raw(obj: obj.compliance_plan)
    end
  end
end
