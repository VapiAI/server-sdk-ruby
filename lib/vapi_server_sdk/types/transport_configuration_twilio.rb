# frozen_string_literal: true

require_relative "transport_configuration_twilio_recording_channels"
require "ostruct"
require "json"

module Vapi
  class TransportConfigurationTwilio
    # @return [String]
    attr_reader :provider
    # @return [Float] The integer number of seconds that we should allow the phone to ring before
    #  assuming there is no answer.
    #  The default is `60` seconds and the maximum is `600` seconds.
    #  For some call flows, we will add a 5-second buffer to the timeout value you
    #  provide.
    #  For this reason, a timeout value of 10 seconds could result in an actual timeout
    #  closer to 15 seconds.
    #  You can set this to a short time, such as `15` seconds, to hang up before
    #  reaching an answering machine or voicemail.
    #  @default 60
    attr_reader :timeout
    # @return [Boolean] Whether to record the call.
    #  Can be `true` to record the phone call, or `false` to not.
    #  The default is `false`.
    #  @default false
    attr_reader :record
    # @return [Vapi::TransportConfigurationTwilioRecordingChannels] The number of channels in the final recording.
    #  Can be: `mono` or `dual`.
    #  The default is `mono`.
    #  `mono` records both legs of the call in a single channel of the recording file.
    #  `dual` records each leg to a separate channel of the recording file.
    #  The first channel of a dual-channel recording contains the parent call and the
    #  second channel contains the child call.
    #  @default 'mono'
    attr_reader :recording_channels
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param timeout [Float] The integer number of seconds that we should allow the phone to ring before
    #  assuming there is no answer.
    #  The default is `60` seconds and the maximum is `600` seconds.
    #  For some call flows, we will add a 5-second buffer to the timeout value you
    #  provide.
    #  For this reason, a timeout value of 10 seconds could result in an actual timeout
    #  closer to 15 seconds.
    #  You can set this to a short time, such as `15` seconds, to hang up before
    #  reaching an answering machine or voicemail.
    #  @default 60
    # @param record [Boolean] Whether to record the call.
    #  Can be `true` to record the phone call, or `false` to not.
    #  The default is `false`.
    #  @default false
    # @param recording_channels [Vapi::TransportConfigurationTwilioRecordingChannels] The number of channels in the final recording.
    #  Can be: `mono` or `dual`.
    #  The default is `mono`.
    #  `mono` records both legs of the call in a single channel of the recording file.
    #  `dual` records each leg to a separate channel of the recording file.
    #  The first channel of a dual-channel recording contains the parent call and the
    #  second channel contains the child call.
    #  @default 'mono'
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransportConfigurationTwilio]
    def initialize(provider:, timeout: OMIT, record: OMIT, recording_channels: OMIT, additional_properties: nil)
      @provider = provider
      @timeout = timeout if timeout != OMIT
      @record = record if record != OMIT
      @recording_channels = recording_channels if recording_channels != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "timeout": timeout,
        "record": record,
        "recordingChannels": recording_channels
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TransportConfigurationTwilio
    #
    # @param json_object [String]
    # @return [Vapi::TransportConfigurationTwilio]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      timeout = parsed_json["timeout"]
      record = parsed_json["record"]
      recording_channels = parsed_json["recordingChannels"]
      new(
        provider: provider,
        timeout: timeout,
        record: record,
        recording_channels: recording_channels,
        additional_properties: struct
      )
    end

    # Serialize an instance of TransportConfigurationTwilio to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.timeout&.is_a?(Float) != false || raise("Passed value for field obj.timeout is not the expected type, validation failed.")
      obj.record&.is_a?(Boolean) != false || raise("Passed value for field obj.record is not the expected type, validation failed.")
      obj.recording_channels&.is_a?(Vapi::TransportConfigurationTwilioRecordingChannels) != false || raise("Passed value for field obj.recording_channels is not the expected type, validation failed.")
    end
  end
end
