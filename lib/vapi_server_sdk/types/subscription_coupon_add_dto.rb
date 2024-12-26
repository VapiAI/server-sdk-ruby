# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class SubscriptionCouponAddDto
    # @return [String] This is the ID of the org within the subscription which the coupon will take
    #  effect on.
    attr_reader :org_id
    # @return [String] This is the code of the coupon to apply to the subscription.
    attr_reader :coupon_code
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param org_id [String] This is the ID of the org within the subscription which the coupon will take
    #  effect on.
    # @param coupon_code [String] This is the code of the coupon to apply to the subscription.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SubscriptionCouponAddDto]
    def initialize(org_id:, coupon_code:, additional_properties: nil)
      @org_id = org_id
      @coupon_code = coupon_code
      @additional_properties = additional_properties
      @_field_set = { "orgId": org_id, "couponCode": coupon_code }
    end

    # Deserialize a JSON object to an instance of SubscriptionCouponAddDto
    #
    # @param json_object [String]
    # @return [Vapi::SubscriptionCouponAddDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      org_id = parsed_json["orgId"]
      coupon_code = parsed_json["couponCode"]
      new(
        org_id: org_id,
        coupon_code: coupon_code,
        additional_properties: struct
      )
    end

    # Serialize an instance of SubscriptionCouponAddDto to a JSON object
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
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.coupon_code.is_a?(String) != false || raise("Passed value for field obj.coupon_code is not the expected type, validation failed.")
    end
  end
end
