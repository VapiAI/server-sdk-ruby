# frozen_string_literal: true
require "json"
require_relative "../../types/test_suite_test_voice"
require_relative "../../types/test_suite_test_chat"

module Vapi
  module TestSuiteTests
    class TestSuiteTestControllerUpdateResponse
    # @return [Object] 
      attr_reader :member
    # @return [String] 
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object] 
      # @param discriminant [String] 
      # @return [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end
# Deserialize a JSON object to an instance of
#  TestSuiteTestControllerUpdateResponse
      #
      # @param json_object [String] 
      # @return [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        case struct.type
        when "voice"
          member = Vapi::TestSuiteTestVoice.from_json(json_object: json_object)
        when "chat"
          member = Vapi::TestSuiteTestChat.from_json(json_object: json_object)
        else
          member = Vapi::TestSuiteTestVoice.from_json(json_object: json_object)
        end
        new(member: member, discriminant: struct.type)
      end
# For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json
        case @discriminant
        when "voice"
          { **@member.to_json, type: @discriminant }.to_json
        when "chat"
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
        when "voice"
          Vapi::TestSuiteTestVoice.validate_raw(obj: obj)
        when "chat"
          Vapi::TestSuiteTestChat.validate_raw(obj: obj)
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
      # @param member [Vapi::TestSuiteTestVoice] 
      # @return [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse]
      def self.voice(member:)
        new(member: member, discriminant: "voice")
      end
      # @param member [Vapi::TestSuiteTestChat] 
      # @return [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse]
      def self.chat(member:)
        new(member: member, discriminant: "chat")
      end
    end
  end
end