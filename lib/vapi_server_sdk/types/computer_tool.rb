# frozen_string_literal: true

require_relative "computer_tool_messages_item"
require_relative "server"
require "date"
require_relative "open_ai_function"
require "ostruct"
require "json"

module Vapi
  class ComputerTool
    # @return [Array<Vapi::ComputerToolMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    attr_reader :messages
    # @return [String] The sub type of tool.
    attr_reader :sub_type
    # @return [Vapi::Server]
    #  This is the server where a `tool-calls` webhook will be sent.
    #  Notes:
    #  - Webhook is sent to this server when a tool call is made.
    #  - Webhook contains the call, assistant, and phone number objects.
    #  - Webhook contains the variables set on the assistant.
    #  - Webhook is sent to the first available URL in this order:
    #  {{tool.server.url}}, {{assistant.server.url}}, {{phoneNumber.server.url}},
    #  {{org.server.url}}.
    #  - Webhook expects a response with tool call result.
    attr_reader :server
    # @return [String] This is the unique identifier for the tool.
    attr_reader :id
    # @return [String] This is the unique identifier for the organization that this tool belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the tool was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the tool was last updated.
    attr_reader :updated_at
    # @return [Vapi::OpenAiFunction] This is the function definition of the tool.
    #  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
    #  tool-specific fields like `tool.destinations`. But, even in those cases, you can
    #  provide a custom function definition for advanced use cases.
    #  An example of an advanced use case is if you want to customize the message
    #  that's spoken for `endCall` tool. You can specify a function where it returns an
    #  argument "reason". Then, in `messages` array, you can have many
    #  "request-complete" messages. One of these messages will be triggered if the
    #  `messages[].conditions` matches the "reason" argument.
    attr_reader :function
    # @return [String] The name of the tool, fixed to 'computer'
    attr_reader :name
    # @return [Float] The display width in pixels
    attr_reader :display_width_px
    # @return [Float] The display height in pixels
    attr_reader :display_height_px
    # @return [Float] Optional display number
    attr_reader :display_number
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::ComputerToolMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    # @param sub_type [String] The sub type of tool.
    # @param server [Vapi::Server]
    #  This is the server where a `tool-calls` webhook will be sent.
    #  Notes:
    #  - Webhook is sent to this server when a tool call is made.
    #  - Webhook contains the call, assistant, and phone number objects.
    #  - Webhook contains the variables set on the assistant.
    #  - Webhook is sent to the first available URL in this order:
    #  {{tool.server.url}}, {{assistant.server.url}}, {{phoneNumber.server.url}},
    #  {{org.server.url}}.
    #  - Webhook expects a response with tool call result.
    # @param id [String] This is the unique identifier for the tool.
    # @param org_id [String] This is the unique identifier for the organization that this tool belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the tool was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the tool was last updated.
    # @param function [Vapi::OpenAiFunction] This is the function definition of the tool.
    #  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
    #  tool-specific fields like `tool.destinations`. But, even in those cases, you can
    #  provide a custom function definition for advanced use cases.
    #  An example of an advanced use case is if you want to customize the message
    #  that's spoken for `endCall` tool. You can specify a function where it returns an
    #  argument "reason". Then, in `messages` array, you can have many
    #  "request-complete" messages. One of these messages will be triggered if the
    #  `messages[].conditions` matches the "reason" argument.
    # @param name [String] The name of the tool, fixed to 'computer'
    # @param display_width_px [Float] The display width in pixels
    # @param display_height_px [Float] The display height in pixels
    # @param display_number [Float] Optional display number
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ComputerTool]
    def initialize(sub_type:, id:, org_id:, created_at:, updated_at:, name:, display_width_px:, display_height_px:,
                   messages: OMIT, server: OMIT, function: OMIT, display_number: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @sub_type = sub_type
      @server = server if server != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @function = function if function != OMIT
      @name = name
      @display_width_px = display_width_px
      @display_height_px = display_height_px
      @display_number = display_number if display_number != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "subType": sub_type,
        "server": server,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "function": function,
        "name": name,
        "displayWidthPx": display_width_px,
        "displayHeightPx": display_height_px,
        "displayNumber": display_number
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ComputerTool
    #
    # @param json_object [String]
    # @return [Vapi::ComputerTool]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ComputerToolMessagesItem.from_json(json_object: item)
      end
      sub_type = parsed_json["subType"]
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      if parsed_json["function"].nil?
        function = nil
      else
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      end
      name = parsed_json["name"]
      display_width_px = parsed_json["displayWidthPx"]
      display_height_px = parsed_json["displayHeightPx"]
      display_number = parsed_json["displayNumber"]
      new(
        messages: messages,
        sub_type: sub_type,
        server: server,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        function: function,
        name: name,
        display_width_px: display_width_px,
        display_height_px: display_height_px,
        display_number: display_number,
        additional_properties: struct
      )
    end

    # Serialize an instance of ComputerTool to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.sub_type.is_a?(String) != false || raise("Passed value for field obj.sub_type is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.display_width_px.is_a?(Float) != false || raise("Passed value for field obj.display_width_px is not the expected type, validation failed.")
      obj.display_height_px.is_a?(Float) != false || raise("Passed value for field obj.display_height_px is not the expected type, validation failed.")
      obj.display_number&.is_a?(Float) != false || raise("Passed value for field obj.display_number is not the expected type, validation failed.")
    end
  end
end
