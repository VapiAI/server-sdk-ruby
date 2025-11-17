# frozen_string_literal: true

require_relative "transfer_assistant_model_provider"
require "ostruct"
require "json"

module Vapi
  class TransferAssistantModel
    # @return [Vapi::TransferAssistantModelProvider] The model provider for the transfer assistant
    attr_reader :provider
    # @return [String] The model name - must be compatible with the selected provider
    attr_reader :model
    # @return [Array<Object>] These are the messages used to configure the transfer assistant.
    #  @default: ```
    #  [
    #  {
    #  role: 'system',
    #  content: 'You are a transfer assistant designed to facilitate call
    #  transfers. Your core responsibility is to manage the transfer process
    #  efficiently.\n\n## Core Responsibility\n- Facilitate the transfer process by
    #  using transferSuccessful or transferCancel tools appropriately\n\n## When to
    #  Respond\n- Answer questions about the transfer process or provide summaries when
    #  specifically asked by the operator\n- Respond to direct questions about the
    #  current transfer situation\n\n## What to Avoid\n- Do not discuss topics
    #  unrelated to the transfer\n- Do not engage in general conversation\n- Keep all
    #  interactions focused on facilitating the transfer\n\n## Transfer Tools\n- Use
    #  transferSuccessful when the transfer should proceed\n- Use transferCancel when
    #  the transfer cannot be completed\n\nStay focused on your core responsibility of
    #  facilitating transfers.'
    #  }
    #  ]```
    #  **Default Behavior:** If you don't provide any messages or don't include a
    #  system message as the first message, the default system message above will be
    #  automatically added.
    #  **Override Default:** To replace the default system message, provide your own
    #  system message as the first message in the array.
    #  **Add Context:** You can provide additional messages (user, assistant, etc.) to
    #  add context while keeping the default system message, or combine them with your
    #  custom system message.
    attr_reader :messages
    # @return [Array<Object>] Tools available to the transfer assistant during warm-transfer-experimental.
    #  **Default Behavior:** The transfer assistant will ALWAYS have both
    #  `transferSuccessful` and `transferCancel` tools automatically added, regardless
    #  of what you provide here.
    #  **Default Tools:**
    #  - `transferSuccessful`: "Call this function to confirm the transfer is
    #  successful and connect the customer. Use this when you detect a human has
    #  answered and is ready to take the call."
    #  - `transferCancel`: "Call this function to cancel the transfer when no human
    #  answers or transfer should not proceed. Use this when you detect voicemail, busy
    #  signal, or no answer."
    #  **Customization:** You can override the default tools by providing
    #  `transferSuccessful` and/or `transferCancel` tools with custom `function` or
    #  `messages` configurations.
    #  **Additional Tools:** You can also provide other tools, but the two transfer
    #  tools will always be present and available to the assistant.
    attr_reader :tools
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::TransferAssistantModelProvider] The model provider for the transfer assistant
    # @param model [String] The model name - must be compatible with the selected provider
    # @param messages [Array<Object>] These are the messages used to configure the transfer assistant.
    #  @default: ```
    #  [
    #  {
    #  role: 'system',
    #  content: 'You are a transfer assistant designed to facilitate call
    #  transfers. Your core responsibility is to manage the transfer process
    #  efficiently.\n\n## Core Responsibility\n- Facilitate the transfer process by
    #  using transferSuccessful or transferCancel tools appropriately\n\n## When to
    #  Respond\n- Answer questions about the transfer process or provide summaries when
    #  specifically asked by the operator\n- Respond to direct questions about the
    #  current transfer situation\n\n## What to Avoid\n- Do not discuss topics
    #  unrelated to the transfer\n- Do not engage in general conversation\n- Keep all
    #  interactions focused on facilitating the transfer\n\n## Transfer Tools\n- Use
    #  transferSuccessful when the transfer should proceed\n- Use transferCancel when
    #  the transfer cannot be completed\n\nStay focused on your core responsibility of
    #  facilitating transfers.'
    #  }
    #  ]```
    #  **Default Behavior:** If you don't provide any messages or don't include a
    #  system message as the first message, the default system message above will be
    #  automatically added.
    #  **Override Default:** To replace the default system message, provide your own
    #  system message as the first message in the array.
    #  **Add Context:** You can provide additional messages (user, assistant, etc.) to
    #  add context while keeping the default system message, or combine them with your
    #  custom system message.
    # @param tools [Array<Object>] Tools available to the transfer assistant during warm-transfer-experimental.
    #  **Default Behavior:** The transfer assistant will ALWAYS have both
    #  `transferSuccessful` and `transferCancel` tools automatically added, regardless
    #  of what you provide here.
    #  **Default Tools:**
    #  - `transferSuccessful`: "Call this function to confirm the transfer is
    #  successful and connect the customer. Use this when you detect a human has
    #  answered and is ready to take the call."
    #  - `transferCancel`: "Call this function to cancel the transfer when no human
    #  answers or transfer should not proceed. Use this when you detect voicemail, busy
    #  signal, or no answer."
    #  **Customization:** You can override the default tools by providing
    #  `transferSuccessful` and/or `transferCancel` tools with custom `function` or
    #  `messages` configurations.
    #  **Additional Tools:** You can also provide other tools, but the two transfer
    #  tools will always be present and available to the assistant.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferAssistantModel]
    def initialize(provider:, model:, messages: OMIT, tools: OMIT, additional_properties: nil)
      @provider = provider
      @model = model
      @messages = messages if messages != OMIT
      @tools = tools if tools != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "model": model, "messages": messages, "tools": tools }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TransferAssistantModel
    #
    # @param json_object [String]
    # @return [Vapi::TransferAssistantModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      model = parsed_json["model"]
      messages = parsed_json["messages"]
      tools = parsed_json["tools"]
      new(
        provider: provider,
        model: model,
        messages: messages,
        tools: tools,
        additional_properties: struct
      )
    end

    # Serialize an instance of TransferAssistantModel to a JSON object
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
      obj.provider.is_a?(Vapi::TransferAssistantModelProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.model.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.tools&.is_a?(Array) != false || raise("Passed value for field obj.tools is not the expected type, validation failed.")
    end
  end
end
