# frozen_string_literal: true

require "json"
require_relative "../../types/dtmf_tool"
require_relative "../../types/end_call_tool"
require_relative "../../types/function_tool"
require_relative "../../types/ghl_tool"
require_relative "../../types/make_tool"
require_relative "../../types/transfer_call_tool"
require_relative "../../types/output_tool"

module Vapi
  class Tools
    class ToolsGetResponse
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Tools::ToolsGetResponse]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of ToolsGetResponse
      #
      # @param json_object [String]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "dtmf"
                   Vapi::DtmfTool.from_json(json_object: json_object)
                 when "endCall"
                   Vapi::EndCallTool.from_json(json_object: json_object)
                 when "function"
                   Vapi::FunctionTool.from_json(json_object: json_object)
                 when "ghl"
                   Vapi::GhlTool.from_json(json_object: json_object)
                 when "make"
                   Vapi::MakeTool.from_json(json_object: json_object)
                 when "transferCall"
                   Vapi::TransferCallTool.from_json(json_object: json_object)
                 when "output"
                   Vapi::OutputTool.from_json(json_object: json_object)
                 else
                   Vapi::DtmfTool.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "dtmf"
          { **@member.to_json, type: @discriminant }.to_json
        when "endCall"
          { **@member.to_json, type: @discriminant }.to_json
        when "function"
          { **@member.to_json, type: @discriminant }.to_json
        when "ghl"
          { **@member.to_json, type: @discriminant }.to_json
        when "make"
          { **@member.to_json, type: @discriminant }.to_json
        when "transferCall"
          { **@member.to_json, type: @discriminant }.to_json
        when "output"
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
        when "dtmf"
          Vapi::DtmfTool.validate_raw(obj: obj)
        when "endCall"
          Vapi::EndCallTool.validate_raw(obj: obj)
        when "function"
          Vapi::FunctionTool.validate_raw(obj: obj)
        when "ghl"
          Vapi::GhlTool.validate_raw(obj: obj)
        when "make"
          Vapi::MakeTool.validate_raw(obj: obj)
        when "transferCall"
          Vapi::TransferCallTool.validate_raw(obj: obj)
        when "output"
          Vapi::OutputTool.validate_raw(obj: obj)
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

      # @param member [Vapi::DtmfTool]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.dtmf(member:)
        new(member: member, discriminant: "dtmf")
      end

      # @param member [Vapi::EndCallTool]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.end_call(member:)
        new(member: member, discriminant: "endCall")
      end

      # @param member [Vapi::FunctionTool]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.function(member:)
        new(member: member, discriminant: "function")
      end

      # @param member [Vapi::GhlTool]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.ghl(member:)
        new(member: member, discriminant: "ghl")
      end

      # @param member [Vapi::MakeTool]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.make(member:)
        new(member: member, discriminant: "make")
      end

      # @param member [Vapi::TransferCallTool]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.transfer_call(member:)
        new(member: member, discriminant: "transferCall")
      end

      # @param member [Vapi::OutputTool]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.output(member:)
        new(member: member, discriminant: "output")
      end
    end
  end
end
