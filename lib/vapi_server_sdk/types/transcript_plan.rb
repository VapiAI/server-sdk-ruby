# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class TranscriptPlan
  # @return [Boolean] This determines whether the transcript is stored in `call.artifact.transcript`.
#  Defaults to true.
#  @default true
    attr_reader :enabled
  # @return [String] This is the name of the assistant in the transcript. Defaults to 'AI'.
#  Usage:
#  - If you want to change the name of the assistant in the transcript, set this.
#  Example, here is what the transcript would look like with `assistantName` set to
#  'Buyer':
#  ```
#  User: Hello, how are you?
#  Buyer: I'm fine.
#  User: Do you want to buy a car?
#  Buyer: No.
#  ```
#  @default 'AI'
    attr_reader :assistant_name
  # @return [String] This is the name of the user in the transcript. Defaults to 'User'.
#  Usage:
#  - If you want to change the name of the user in the transcript, set this.
#  Example, here is what the transcript would look like with `userName` set to
#  'Seller':
#  ```
#  Seller: Hello, how are you?
#  AI: I'm fine.
#  Seller: Do you want to buy a car?
#  AI: No.
#  ```
#  @default 'User'
    attr_reader :user_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param enabled [Boolean] This determines whether the transcript is stored in `call.artifact.transcript`.
#  Defaults to true.
#  @default true
    # @param assistant_name [String] This is the name of the assistant in the transcript. Defaults to 'AI'.
#  Usage:
#  - If you want to change the name of the assistant in the transcript, set this.
#  Example, here is what the transcript would look like with `assistantName` set to
#  'Buyer':
#  ```
#  User: Hello, how are you?
#  Buyer: I'm fine.
#  User: Do you want to buy a car?
#  Buyer: No.
#  ```
#  @default 'AI'
    # @param user_name [String] This is the name of the user in the transcript. Defaults to 'User'.
#  Usage:
#  - If you want to change the name of the user in the transcript, set this.
#  Example, here is what the transcript would look like with `userName` set to
#  'Seller':
#  ```
#  Seller: Hello, how are you?
#  AI: I'm fine.
#  Seller: Do you want to buy a car?
#  AI: No.
#  ```
#  @default 'User'
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TranscriptPlan]
    def initialize(enabled: OMIT, assistant_name: OMIT, user_name: OMIT, additional_properties: nil)
      @enabled = enabled if enabled != OMIT
      @assistant_name = assistant_name if assistant_name != OMIT
      @user_name = user_name if user_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "enabled": enabled, "assistantName": assistant_name, "userName": user_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TranscriptPlan
    #
    # @param json_object [String] 
    # @return [Vapi::TranscriptPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      enabled = parsed_json["enabled"]
      assistant_name = parsed_json["assistantName"]
      user_name = parsed_json["userName"]
      new(
        enabled: enabled,
        assistant_name: assistant_name,
        user_name: user_name,
        additional_properties: struct
      )
    end
# Serialize an instance of TranscriptPlan to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.assistant_name&.is_a?(String) != false || raise("Passed value for field obj.assistant_name is not the expected type, validation failed.")
      obj.user_name&.is_a?(String) != false || raise("Passed value for field obj.user_name is not the expected type, validation failed.")
    end
  end
end