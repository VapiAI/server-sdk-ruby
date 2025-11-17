# frozen_string_literal: true

require "json"
require_relative "o_auth_2_authentication_plan"
require_relative "hmac_authentication_plan"
require_relative "bearer_authentication_plan"

module Vapi
  # This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and
  #  Bearer authentication.
  class WebhookCredentialAuthenticationPlan
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::WebhookCredentialAuthenticationPlan]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WebhookCredentialAuthenticationPlan
    #
    # @param json_object [String]
    # @return [Vapi::WebhookCredentialAuthenticationPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "oauth2"
                 Vapi::OAuth2AuthenticationPlan.from_json(json_object: json_object)
               when "hmac"
                 Vapi::HmacAuthenticationPlan.from_json(json_object: json_object)
               when "bearer"
                 Vapi::BearerAuthenticationPlan.from_json(json_object: json_object)
               else
                 Vapi::OAuth2AuthenticationPlan.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "oauth2"
        { **@member.to_json, type: @discriminant }.to_json
      when "hmac"
        { **@member.to_json, type: @discriminant }.to_json
      when "bearer"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "oauth2"
        Vapi::OAuth2AuthenticationPlan.validate_raw(obj: obj)
      when "hmac"
        Vapi::HmacAuthenticationPlan.validate_raw(obj: obj)
      when "bearer"
        Vapi::BearerAuthenticationPlan.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [Vapi::OAuth2AuthenticationPlan]
    # @return [Vapi::WebhookCredentialAuthenticationPlan]
    def self.oauth_2(member:)
      new(member: member, discriminant: "oauth2")
    end

    # @param member [Vapi::HmacAuthenticationPlan]
    # @return [Vapi::WebhookCredentialAuthenticationPlan]
    def self.hmac(member:)
      new(member: member, discriminant: "hmac")
    end

    # @param member [Vapi::BearerAuthenticationPlan]
    # @return [Vapi::WebhookCredentialAuthenticationPlan]
    def self.bearer(member:)
      new(member: member, discriminant: "bearer")
    end
  end
end
