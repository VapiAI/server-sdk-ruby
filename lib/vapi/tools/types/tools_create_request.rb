# frozen_string_literal: true

require "json"
require_relative "../../types/create_dtmf_tool_dto"
require_relative "../../types/create_end_call_tool_dto"
require_relative "../../types/create_function_tool_dto"
require_relative "../../types/create_ghl_tool_dto"
require_relative "../../types/create_make_tool_dto"
require_relative "../../types/create_transfer_call_tool_dto"
require_relative "../../types/create_output_tool_dto"

module Vapi
  class Tools
    class ToolsCreateRequest
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of ToolsCreateRequest
      #
      # @param json_object [String]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "dtmf"
                   Vapi::CreateDtmfToolDto.from_json(json_object: json_object)
                 when "endCall"
                   Vapi::CreateEndCallToolDto.from_json(json_object: json_object)
                 when "function"
                   Vapi::CreateFunctionToolDto.from_json(json_object: json_object)
                 when "ghl"
                   Vapi::CreateGhlToolDto.from_json(json_object: json_object)
                 when "make"
                   Vapi::CreateMakeToolDto.from_json(json_object: json_object)
                 when "transferCall"
                   Vapi::CreateTransferCallToolDto.from_json(json_object: json_object)
                 when "output"
                   Vapi::CreateOutputToolDto.from_json(json_object: json_object)
                 else
                   Vapi::CreateDtmfToolDto.from_json(json_object: json_object)
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
          Vapi::CreateDtmfToolDto.validate_raw(obj: obj)
        when "endCall"
          Vapi::CreateEndCallToolDto.validate_raw(obj: obj)
        when "function"
          Vapi::CreateFunctionToolDto.validate_raw(obj: obj)
        when "ghl"
          Vapi::CreateGhlToolDto.validate_raw(obj: obj)
        when "make"
          Vapi::CreateMakeToolDto.validate_raw(obj: obj)
        when "transferCall"
          Vapi::CreateTransferCallToolDto.validate_raw(obj: obj)
        when "output"
          Vapi::CreateOutputToolDto.validate_raw(obj: obj)
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

      # @param member [Vapi::CreateDtmfToolDto]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.dtmf(member:)
        new(member: member, discriminant: "dtmf")
      end

      # @param member [Vapi::CreateEndCallToolDto]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.end_call(member:)
        new(member: member, discriminant: "endCall")
      end

      # @param member [Vapi::CreateFunctionToolDto]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.function(member:)
        new(member: member, discriminant: "function")
      end

      # @param member [Vapi::CreateGhlToolDto]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.ghl(member:)
        new(member: member, discriminant: "ghl")
      end

      # @param member [Vapi::CreateMakeToolDto]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.make(member:)
        new(member: member, discriminant: "make")
      end

      # @param member [Vapi::CreateTransferCallToolDto]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.transfer_call(member:)
        new(member: member, discriminant: "transferCall")
      end

      # @param member [Vapi::CreateOutputToolDto]
      # @return [Vapi::Tools::ToolsCreateRequest]
      def self.output(member:)
        new(member: member, discriminant: "output")
      end
    end
  end
end
