# frozen_string_literal: true

require_relative "payment_status"
require "date"
require "ostruct"
require "json"

module Vapi
  class Payment
    # @return [String] This is the id of the payment
    attr_reader :id
    # @return [String] This is the id of the org
    attr_reader :org_id
    # @return [String] This is the total cost of the payment, which is the sum of all the costs in the
    #  costs object.
    #  Note: this is a string to avoid floating point precision issues.
    attr_reader :cost
    # @return [Array<Hash{String => Object}>] This is the itemized breakdown of payment amounts
    attr_reader :costs
    # @return [Vapi::PaymentStatus] This is the status of the payment
    attr_reader :status
    # @return [DateTime] This is the timestamp when the payment was created
    attr_reader :created_at
    # @return [DateTime] This is the timestamp when the payment was last updated
    attr_reader :updated_at
    # @return [Boolean] This indicates if this payment was automatically generated by the auto-reload
    #  feature
    attr_reader :is_auto_reload
    # @return [String] This is the id of the subscription the payment belongs to
    attr_reader :subscription_id
    # @return [String] This is the id of the call
    attr_reader :call_id
    # @return [String] This is the id of the purchased phone number
    attr_reader :phone_number_id
    # @return [String] This is the id of the associated stripe payment intent
    attr_reader :stripe_payment_intent_id
    # @return [String] This is the id of the associated stripe invoice
    attr_reader :stripe_invoice_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the id of the payment
    # @param org_id [String] This is the id of the org
    # @param cost [String] This is the total cost of the payment, which is the sum of all the costs in the
    #  costs object.
    #  Note: this is a string to avoid floating point precision issues.
    # @param costs [Array<Hash{String => Object}>] This is the itemized breakdown of payment amounts
    # @param status [Vapi::PaymentStatus] This is the status of the payment
    # @param created_at [DateTime] This is the timestamp when the payment was created
    # @param updated_at [DateTime] This is the timestamp when the payment was last updated
    # @param is_auto_reload [Boolean] This indicates if this payment was automatically generated by the auto-reload
    #  feature
    # @param subscription_id [String] This is the id of the subscription the payment belongs to
    # @param call_id [String] This is the id of the call
    # @param phone_number_id [String] This is the id of the purchased phone number
    # @param stripe_payment_intent_id [String] This is the id of the associated stripe payment intent
    # @param stripe_invoice_id [String] This is the id of the associated stripe invoice
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Payment]
    def initialize(id:, cost:, costs:, status:, created_at:, updated_at:, is_auto_reload:, subscription_id:,
                   org_id: OMIT, call_id: OMIT, phone_number_id: OMIT, stripe_payment_intent_id: OMIT, stripe_invoice_id: OMIT, additional_properties: nil)
      @id = id
      @org_id = org_id if org_id != OMIT
      @cost = cost
      @costs = costs
      @status = status
      @created_at = created_at
      @updated_at = updated_at
      @is_auto_reload = is_auto_reload
      @subscription_id = subscription_id
      @call_id = call_id if call_id != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @stripe_payment_intent_id = stripe_payment_intent_id if stripe_payment_intent_id != OMIT
      @stripe_invoice_id = stripe_invoice_id if stripe_invoice_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "orgId": org_id,
        "cost": cost,
        "costs": costs,
        "status": status,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "isAutoReload": is_auto_reload,
        "subscriptionId": subscription_id,
        "callId": call_id,
        "phoneNumberId": phone_number_id,
        "stripePaymentIntentId": stripe_payment_intent_id,
        "stripeInvoiceId": stripe_invoice_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Payment
    #
    # @param json_object [String]
    # @return [Vapi::Payment]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      cost = parsed_json["cost"]
      costs = parsed_json["costs"]
      status = parsed_json["status"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      is_auto_reload = parsed_json["isAutoReload"]
      subscription_id = parsed_json["subscriptionId"]
      call_id = parsed_json["callId"]
      phone_number_id = parsed_json["phoneNumberId"]
      stripe_payment_intent_id = parsed_json["stripePaymentIntentId"]
      stripe_invoice_id = parsed_json["stripeInvoiceId"]
      new(
        id: id,
        org_id: org_id,
        cost: cost,
        costs: costs,
        status: status,
        created_at: created_at,
        updated_at: updated_at,
        is_auto_reload: is_auto_reload,
        subscription_id: subscription_id,
        call_id: call_id,
        phone_number_id: phone_number_id,
        stripe_payment_intent_id: stripe_payment_intent_id,
        stripe_invoice_id: stripe_invoice_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of Payment to a JSON object
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
      obj.org_id&.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.cost.is_a?(String) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.costs.is_a?(Array) != false || raise("Passed value for field obj.costs is not the expected type, validation failed.")
      obj.status.is_a?(Vapi::PaymentStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.is_auto_reload.is_a?(Boolean) != false || raise("Passed value for field obj.is_auto_reload is not the expected type, validation failed.")
      obj.subscription_id.is_a?(String) != false || raise("Passed value for field obj.subscription_id is not the expected type, validation failed.")
      obj.call_id&.is_a?(String) != false || raise("Passed value for field obj.call_id is not the expected type, validation failed.")
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.stripe_payment_intent_id&.is_a?(String) != false || raise("Passed value for field obj.stripe_payment_intent_id is not the expected type, validation failed.")
      obj.stripe_invoice_id&.is_a?(String) != false || raise("Passed value for field obj.stripe_invoice_id is not the expected type, validation failed.")
    end
  end
end
