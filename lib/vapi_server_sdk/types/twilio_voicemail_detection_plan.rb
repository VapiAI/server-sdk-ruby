# frozen_string_literal: true

require_relative "twilio_voicemail_detection_plan_voicemail_detection_types_item"
require "ostruct"
require "json"

module Vapi
  class TwilioVoicemailDetectionPlan
    # @return [Array<Vapi::TwilioVoicemailDetectionPlanVoicemailDetectionTypesItem>] These are the AMD messages from Twilio that are considered as voicemail. Default
    #  is ['machine_end_beep', 'machine_end_silence'].
    #  @default {Array} ['machine_end_beep', 'machine_end_silence']
    attr_reader :voicemail_detection_types
    # @return [Boolean] This sets whether the assistant should detect voicemail. Defaults to true.
    #  @default true
    attr_reader :enabled
    # @return [Float] The number of seconds that Twilio should attempt to perform answering machine
    #  detection before timing out and returning AnsweredBy as unknown. Default is 30
    #  seconds.
    #  Increasing this value will provide the engine more time to make a determination.
    #  This can be useful when DetectMessageEnd is provided in the MachineDetection
    #  parameter and there is an expectation of long answering machine greetings that
    #  can exceed 30 seconds.
    #  Decreasing this value will reduce the amount of time the engine has to make a
    #  determination. This can be particularly useful when the Enable option is
    #  provided in the MachineDetection parameter and you want to limit the time for
    #  initial detection.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 30
    attr_reader :machine_detection_timeout
    # @return [Float] The number of milliseconds that is used as the measuring stick for the length of
    #  the speech activity. Durations lower than this value will be interpreted as a
    #  human, longer as a machine. Default is 2400 milliseconds.
    #  Increasing this value will reduce the chance of a False Machine (detected
    #  machine, actually human) for a long human greeting (e.g., a business greeting)
    #  but increase the time it takes to detect a machine.
    #  Decreasing this value will reduce the chances of a False Human (detected human,
    #  actually machine) for short voicemail greetings. The value of this parameter may
    #  need to be reduced by more than 1000ms to detect very short voicemail greetings.
    #  A reduction of that significance can result in increased False Machine
    #  detections. Adjusting the MachineDetectionSpeechEndThreshold is likely the
    #  better approach for short voicemails. Decreasing MachineDetectionSpeechThreshold
    #  will also reduce the time it takes to detect a machine.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 2400
    attr_reader :machine_detection_speech_threshold
    # @return [Float] The number of milliseconds of silence after speech activity at which point the
    #  speech activity is considered complete. Default is 1200 milliseconds.
    #  Increasing this value will typically be used to better address the short
    #  voicemail greeting scenarios. For short voicemails, there is typically
    #  1000-2000ms of audio followed by 1200-2400ms of silence and then additional
    #  audio before the beep. Increasing the MachineDetectionSpeechEndThreshold to
    #  ~2500ms will treat the 1200-2400ms of silence as a gap in the greeting but not
    #  the end of the greeting and will result in a machine detection. The downsides of
    #  such a change include:
    #  - Increasing the delay for human detection by the amount you increase this
    #  parameter, e.g., a change of 1200ms to 2500ms increases human detection delay by
    #  1300ms.
    #  - Cases where a human has two utterances separated by a period of silence (e.g.
    #  a "Hello", then 2000ms of silence, and another "Hello") may be interpreted as a
    #  machine.
    #  Decreasing this value will result in faster human detection. The consequence is
    #  that it can lead to increased False Human (detected human, actually machine)
    #  detections because a silence gap in a voicemail greeting (not necessarily just
    #  in short voicemail scenarios) can be incorrectly interpreted as the end of
    #  speech.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 1200
    attr_reader :machine_detection_speech_end_threshold
    # @return [Float] The number of milliseconds of initial silence after which an unknown AnsweredBy
    #  result will be returned. Default is 5000 milliseconds.
    #  Increasing this value will result in waiting for a longer period of initial
    #  silence before returning an 'unknown' AMD result.
    #  Decreasing this value will result in waiting for a shorter period of initial
    #  silence before returning an 'unknown' AMD result.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 5000
    attr_reader :machine_detection_silence_timeout
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voicemail_detection_types [Array<Vapi::TwilioVoicemailDetectionPlanVoicemailDetectionTypesItem>] These are the AMD messages from Twilio that are considered as voicemail. Default
    #  is ['machine_end_beep', 'machine_end_silence'].
    #  @default {Array} ['machine_end_beep', 'machine_end_silence']
    # @param enabled [Boolean] This sets whether the assistant should detect voicemail. Defaults to true.
    #  @default true
    # @param machine_detection_timeout [Float] The number of seconds that Twilio should attempt to perform answering machine
    #  detection before timing out and returning AnsweredBy as unknown. Default is 30
    #  seconds.
    #  Increasing this value will provide the engine more time to make a determination.
    #  This can be useful when DetectMessageEnd is provided in the MachineDetection
    #  parameter and there is an expectation of long answering machine greetings that
    #  can exceed 30 seconds.
    #  Decreasing this value will reduce the amount of time the engine has to make a
    #  determination. This can be particularly useful when the Enable option is
    #  provided in the MachineDetection parameter and you want to limit the time for
    #  initial detection.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 30
    # @param machine_detection_speech_threshold [Float] The number of milliseconds that is used as the measuring stick for the length of
    #  the speech activity. Durations lower than this value will be interpreted as a
    #  human, longer as a machine. Default is 2400 milliseconds.
    #  Increasing this value will reduce the chance of a False Machine (detected
    #  machine, actually human) for a long human greeting (e.g., a business greeting)
    #  but increase the time it takes to detect a machine.
    #  Decreasing this value will reduce the chances of a False Human (detected human,
    #  actually machine) for short voicemail greetings. The value of this parameter may
    #  need to be reduced by more than 1000ms to detect very short voicemail greetings.
    #  A reduction of that significance can result in increased False Machine
    #  detections. Adjusting the MachineDetectionSpeechEndThreshold is likely the
    #  better approach for short voicemails. Decreasing MachineDetectionSpeechThreshold
    #  will also reduce the time it takes to detect a machine.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 2400
    # @param machine_detection_speech_end_threshold [Float] The number of milliseconds of silence after speech activity at which point the
    #  speech activity is considered complete. Default is 1200 milliseconds.
    #  Increasing this value will typically be used to better address the short
    #  voicemail greeting scenarios. For short voicemails, there is typically
    #  1000-2000ms of audio followed by 1200-2400ms of silence and then additional
    #  audio before the beep. Increasing the MachineDetectionSpeechEndThreshold to
    #  ~2500ms will treat the 1200-2400ms of silence as a gap in the greeting but not
    #  the end of the greeting and will result in a machine detection. The downsides of
    #  such a change include:
    #  - Increasing the delay for human detection by the amount you increase this
    #  parameter, e.g., a change of 1200ms to 2500ms increases human detection delay by
    #  1300ms.
    #  - Cases where a human has two utterances separated by a period of silence (e.g.
    #  a "Hello", then 2000ms of silence, and another "Hello") may be interpreted as a
    #  machine.
    #  Decreasing this value will result in faster human detection. The consequence is
    #  that it can lead to increased False Human (detected human, actually machine)
    #  detections because a silence gap in a voicemail greeting (not necessarily just
    #  in short voicemail scenarios) can be incorrectly interpreted as the end of
    #  speech.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 1200
    # @param machine_detection_silence_timeout [Float] The number of milliseconds of initial silence after which an unknown AnsweredBy
    #  result will be returned. Default is 5000 milliseconds.
    #  Increasing this value will result in waiting for a longer period of initial
    #  silence before returning an 'unknown' AMD result.
    #  Decreasing this value will result in waiting for a shorter period of initial
    #  silence before returning an 'unknown' AMD result.
    #  Check the [Twilio
    #  wilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters)
    #  for more info.
    #  @default 5000
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TwilioVoicemailDetectionPlan]
    def initialize(voicemail_detection_types: OMIT, enabled: OMIT, machine_detection_timeout: OMIT,
                   machine_detection_speech_threshold: OMIT, machine_detection_speech_end_threshold: OMIT, machine_detection_silence_timeout: OMIT, additional_properties: nil)
      @voicemail_detection_types = voicemail_detection_types if voicemail_detection_types != OMIT
      @enabled = enabled if enabled != OMIT
      @machine_detection_timeout = machine_detection_timeout if machine_detection_timeout != OMIT
      if machine_detection_speech_threshold != OMIT
        @machine_detection_speech_threshold = machine_detection_speech_threshold
      end
      if machine_detection_speech_end_threshold != OMIT
        @machine_detection_speech_end_threshold = machine_detection_speech_end_threshold
      end
      if machine_detection_silence_timeout != OMIT
        @machine_detection_silence_timeout = machine_detection_silence_timeout
      end
      @additional_properties = additional_properties
      @_field_set = {
        "voicemailDetectionTypes": voicemail_detection_types,
        "enabled": enabled,
        "machineDetectionTimeout": machine_detection_timeout,
        "machineDetectionSpeechThreshold": machine_detection_speech_threshold,
        "machineDetectionSpeechEndThreshold": machine_detection_speech_end_threshold,
        "machineDetectionSilenceTimeout": machine_detection_silence_timeout
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TwilioVoicemailDetectionPlan
    #
    # @param json_object [String]
    # @return [Vapi::TwilioVoicemailDetectionPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      voicemail_detection_types = parsed_json["voicemailDetectionTypes"]
      enabled = parsed_json["enabled"]
      machine_detection_timeout = parsed_json["machineDetectionTimeout"]
      machine_detection_speech_threshold = parsed_json["machineDetectionSpeechThreshold"]
      machine_detection_speech_end_threshold = parsed_json["machineDetectionSpeechEndThreshold"]
      machine_detection_silence_timeout = parsed_json["machineDetectionSilenceTimeout"]
      new(
        voicemail_detection_types: voicemail_detection_types,
        enabled: enabled,
        machine_detection_timeout: machine_detection_timeout,
        machine_detection_speech_threshold: machine_detection_speech_threshold,
        machine_detection_speech_end_threshold: machine_detection_speech_end_threshold,
        machine_detection_silence_timeout: machine_detection_silence_timeout,
        additional_properties: struct
      )
    end

    # Serialize an instance of TwilioVoicemailDetectionPlan to a JSON object
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
      obj.voicemail_detection_types&.is_a?(Array) != false || raise("Passed value for field obj.voicemail_detection_types is not the expected type, validation failed.")
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.machine_detection_timeout&.is_a?(Float) != false || raise("Passed value for field obj.machine_detection_timeout is not the expected type, validation failed.")
      obj.machine_detection_speech_threshold&.is_a?(Float) != false || raise("Passed value for field obj.machine_detection_speech_threshold is not the expected type, validation failed.")
      obj.machine_detection_speech_end_threshold&.is_a?(Float) != false || raise("Passed value for field obj.machine_detection_speech_end_threshold is not the expected type, validation failed.")
      obj.machine_detection_silence_timeout&.is_a?(Float) != false || raise("Passed value for field obj.machine_detection_silence_timeout is not the expected type, validation failed.")
    end
  end
end
