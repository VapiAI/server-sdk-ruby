# frozen_string_literal: true

require "json"
require_relative "../../types/update_dtmf_tool_dto"
require_relative "../../types/update_end_call_tool_dto"
require_relative "../../types/update_function_tool_dto"
require_relative "../../types/update_ghl_tool_dto"
require_relative "../../types/update_make_tool_dto"
require_relative "../../types/update_transfer_call_tool_dto"
require_relative "../../types/update_output_tool_dto"
require_relative "../../types/update_bash_tool_dto"
require_relative "../../types/update_computer_tool_dto"
require_relative "../../types/update_text_editor_tool_dto"

module Vapi
  class Tools
    class ToolsUpdateRequest
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of ToolsUpdateRequest
      #
      # @param json_object [String]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "dtmf"
                   Vapi::UpdateDtmfToolDto.from_json(json_object: json_object)
                 when "endCall"
                   Vapi::UpdateEndCallToolDto.from_json(json_object: json_object)
                 when "function"
                   Vapi::UpdateFunctionToolDto.from_json(json_object: json_object)
                 when "ghl"
                   Vapi::UpdateGhlToolDto.from_json(json_object: json_object)
                 when "make"
                   Vapi::UpdateMakeToolDto.from_json(json_object: json_object)
                 when "transferCall"
                   Vapi::UpdateTransferCallToolDto.from_json(json_object: json_object)
                 when "output"
                   Vapi::UpdateOutputToolDto.from_json(json_object: json_object)
                 when "bash"
                   Vapi::UpdateBashToolDto.from_json(json_object: json_object)
                 when "computer"
                   Vapi::UpdateComputerToolDto.from_json(json_object: json_object)
                 when "textEditor"
                   Vapi::UpdateTextEditorToolDto.from_json(json_object: json_object)
                 else
                   Vapi::UpdateDtmfToolDto.from_json(json_object: json_object)
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
        when "bash"
          { **@member.to_json, type: @discriminant }.to_json
        when "computer"
          { **@member.to_json, type: @discriminant }.to_json
        when "textEditor"
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
          Vapi::UpdateDtmfToolDto.validate_raw(obj: obj)
        when "endCall"
          Vapi::UpdateEndCallToolDto.validate_raw(obj: obj)
        when "function"
          Vapi::UpdateFunctionToolDto.validate_raw(obj: obj)
        when "ghl"
          Vapi::UpdateGhlToolDto.validate_raw(obj: obj)
        when "make"
          Vapi::UpdateMakeToolDto.validate_raw(obj: obj)
        when "transferCall"
          Vapi::UpdateTransferCallToolDto.validate_raw(obj: obj)
        when "output"
          Vapi::UpdateOutputToolDto.validate_raw(obj: obj)
        when "bash"
          Vapi::UpdateBashToolDto.validate_raw(obj: obj)
        when "computer"
          Vapi::UpdateComputerToolDto.validate_raw(obj: obj)
        when "textEditor"
          Vapi::UpdateTextEditorToolDto.validate_raw(obj: obj)
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

      # @param member [Vapi::UpdateDtmfToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.dtmf(member:)
        new(member: member, discriminant: "dtmf")
      end

      # @param member [Vapi::UpdateEndCallToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.end_call(member:)
        new(member: member, discriminant: "endCall")
      end

      # @param member [Vapi::UpdateFunctionToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.function(member:)
        new(member: member, discriminant: "function")
      end

      # @param member [Vapi::UpdateGhlToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.ghl(member:)
        new(member: member, discriminant: "ghl")
      end

      # @param member [Vapi::UpdateMakeToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.make(member:)
        new(member: member, discriminant: "make")
      end

      # @param member [Vapi::UpdateTransferCallToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.transfer_call(member:)
        new(member: member, discriminant: "transferCall")
      end

      # @param member [Vapi::UpdateOutputToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.output(member:)
        new(member: member, discriminant: "output")
      end

      # @param member [Vapi::UpdateBashToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.bash(member:)
        new(member: member, discriminant: "bash")
      end

      # @param member [Vapi::UpdateComputerToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.computer(member:)
        new(member: member, discriminant: "computer")
      end

      # @param member [Vapi::UpdateTextEditorToolDto]
      # @return [Vapi::Tools::ToolsUpdateRequest]
      def self.text_editor(member:)
        new(member: member, discriminant: "textEditor")
      end
    end
  end
end
