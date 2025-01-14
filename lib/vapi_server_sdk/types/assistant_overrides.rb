# frozen_string_literal: true

require_relative "assistant_overrides_transcriber"
require_relative "assistant_overrides_model"
require_relative "assistant_overrides_voice"
require_relative "assistant_overrides_first_message_mode"
require_relative "assistant_overrides_client_messages_item"
require_relative "assistant_overrides_server_messages_item"
require_relative "assistant_overrides_background_sound"
require_relative "transport_configuration_twilio"
require_relative "assistant_overrides_credentials_item"
require_relative "twilio_voicemail_detection"
require_relative "analysis_plan"
require_relative "artifact_plan"
require_relative "message_plan"
require_relative "start_speaking_plan"
require_relative "stop_speaking_plan"
require_relative "monitor_plan"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class AssistantOverrides
    # @return [Vapi::AssistantOverridesTranscriber] These are the options for the assistant's transcriber.
    attr_reader :transcriber
    # @return [Vapi::AssistantOverridesModel] These are the options for the assistant's LLM.
    attr_reader :model
    # @return [Vapi::AssistantOverridesVoice] These are the options for the assistant's voice.
    attr_reader :voice
    # @return [String] This is the first message that the assistant will say. This can also be a URL to
    #  a containerized audio file (mp3, wav, etc.).
    #  If unspecified, assistant will wait for user to speak and use the model to
    #  respond once they speak.
    attr_reader :first_message
    # @return [Vapi::AssistantOverridesFirstMessageMode] This is the mode for the first message. Default is 'assistant-speaks-first'.
    #  Use:
    #  - 'assistant-speaks-first' to have the assistant speak first.
    #  - 'assistant-waits-for-user' to have the assistant wait for the user to speak
    #  first.
    #  - 'assistant-speaks-first-with-model-generated-message' to have the assistant
    #  speak first with a message generated by the model based on the conversation
    #  state. (`assistant.model.messages` at call start, `call.messages` at squad
    #  transfer points).
    #  @default 'assistant-speaks-first'
    attr_reader :first_message_mode
    # @return [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored. At
    #  the end of the call, you will still receive an end-of-call-report message to
    #  store on your server. Defaults to false.
    attr_reader :hipaa_enabled
    # @return [Array<Vapi::AssistantOverridesClientMessagesItem>] These are the messages that will be sent to your Client SDKs. Default is
    #  tatus-update,transfer-update,transcript,tool-calls,user-interrupted,voice-input.
    #  You can check the shape of the messages in ClientMessage schema.
    attr_reader :client_messages
    # @return [Array<Vapi::AssistantOverridesServerMessagesItem>] These are the messages that will be sent to your Server URL. Default is
    #  h-update,status-update,tool-calls,transfer-destination-request,user-interrupted.
    #  You can check the shape of the messages in ServerMessage schema.
    attr_reader :server_messages
    # @return [Float] How many seconds of silence to wait before ending the call. Defaults to 30.
    #  @default 30
    attr_reader :silence_timeout_seconds
    # @return [Float] This is the maximum number of seconds that the call will last. When the call
    #  reaches this duration, it will be ended.
    #  @default 600 (10 minutes)
    attr_reader :max_duration_seconds
    # @return [Vapi::AssistantOverridesBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    attr_reader :background_sound
    # @return [Boolean] This enables filtering of noise and background speech while the user is talking.
    #  Default `false` while in beta.
    #  @default false
    attr_reader :background_denoising_enabled
    # @return [Boolean] This determines whether the model's output is used in conversation history
    #  rather than the transcription of assistant's speech.
    #  Default `false` while in beta.
    #  @default false
    attr_reader :model_output_in_messages_enabled
    # @return [Array<Vapi::TransportConfigurationTwilio>] These are the configurations to be passed to the transport providers of
    #  assistant's calls, like Twilio. You can store multiple configurations for
    #  different transport providers. For a call, only the configuration matching the
    #  call transport provider is used.
    attr_reader :transport_configurations
    # @return [Array<Vapi::AssistantOverridesCredentialsItem>] These are dynamic credentials that will be used for the assistant calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.
    attr_reader :credentials
    # @return [Hash{String => Object}] These are values that will be used to replace the template variables in the
    #  assistant messages and other text-based fields.
    #  This uses LiquidJS syntax. https://liquidjs.com/tutorials/intro-to-liquid.html
    #  So for example, `{{ name }}` will be replaced with the value of `name` in
    #  `variableValues`.
    #  `{{"now" | date: "%b %d, %Y, %I:%M %p", "America/New_York"}}` will be replaced
    #  with the current date and time in New York.
    #  Some VAPI reserved defaults:
    #  - *customer* - the customer object
    attr_reader :variable_values
    # @return [String] This is the name of the assistant.
    #  This is required when you want to transfer between assistants in a call.
    attr_reader :name
    # @return [Vapi::TwilioVoicemailDetection] These are the settings to configure or disable voicemail detection.
    #  Alternatively, voicemail detection can be configured using the
    #  model.tools=[VoicemailTool].
    #  This uses Twilio's built-in detection while the VoicemailTool relies on the
    #  model to detect if a voicemail was reached.
    #  You can use neither of them, one of them, or both of them. By default, Twilio
    #  built-in detection is enabled while VoicemailTool is not.
    attr_reader :voicemail_detection
    # @return [String] This is the message that the assistant will say if the call is forwarded to
    #  voicemail.
    #  If unspecified, it will hang up.
    attr_reader :voicemail_message
    # @return [String] This is the message that the assistant will say if it ends the call.
    #  If unspecified, it will hang up without saying anything.
    attr_reader :end_call_message
    # @return [Array<String>] This list contains phrases that, if spoken by the assistant, will trigger the
    #  call to be hung up. Case insensitive.
    attr_reader :end_call_phrases
    # @return [Hash{String => Object}] This is for metadata you want to store on the assistant.
    attr_reader :metadata
    # @return [Vapi::AnalysisPlan] This is the plan for analysis of assistant's calls. Stored in `call.analysis`.
    attr_reader :analysis_plan
    # @return [Vapi::ArtifactPlan] This is the plan for artifacts generated during assistant's calls. Stored in
    #  `call.artifact`.
    #  Note: `recordingEnabled` is currently at the root level. It will be moved to
    #  `artifactPlan` in the future, but will remain backwards compatible.
    attr_reader :artifact_plan
    # @return [Vapi::MessagePlan] This is the plan for static predefined messages that can be spoken by the
    #  assistant during the call, like `idleMessages`.
    #  Note: `firstMessage`, `voicemailMessage`, and `endCallMessage` are currently at
    #  the root level. They will be moved to `messagePlan` in the future, but will
    #  remain backwards compatible.
    attr_reader :message_plan
    # @return [Vapi::StartSpeakingPlan] This is the plan for when the assistant should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.
    attr_reader :start_speaking_plan
    # @return [Vapi::StopSpeakingPlan] This is the plan for when assistant should stop talking on customer
    #  interruption.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to recognize customer's interruption.
    #  - The assistant is too fast to recognize customer's interruption.
    #  - The assistant is getting interrupted by phrases that are just acknowledgments.
    #  - The assistant is getting interrupted by background noises.
    #  - The assistant is not properly stopping -- it starts talking right after
    #  getting interrupted.
    attr_reader :stop_speaking_plan
    # @return [Vapi::MonitorPlan] This is the plan for real-time monitoring of the assistant's calls.
    #  Usage:
    #  - To enable live listening of the assistant's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the assistant's calls, set
    #  `monitorPlan.controlEnabled` to `true`.
    #  Note, `serverMessages`, `clientMessages`, `serverUrl` and `serverUrlSecret` are
    #  currently at the root level but will be moved to `monitorPlan` in the future.
    #  Will remain backwards compatible
    attr_reader :monitor_plan
    # @return [Array<String>] These are the credentials that will be used for the assistant calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    attr_reader :credential_ids
    # @return [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server.url
    #  2. phoneNumber.serverUrl
    #  3. org.serverUrl
    attr_reader :server
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param transcriber [Vapi::AssistantOverridesTranscriber] These are the options for the assistant's transcriber.
    # @param model [Vapi::AssistantOverridesModel] These are the options for the assistant's LLM.
    # @param voice [Vapi::AssistantOverridesVoice] These are the options for the assistant's voice.
    # @param first_message [String] This is the first message that the assistant will say. This can also be a URL to
    #  a containerized audio file (mp3, wav, etc.).
    #  If unspecified, assistant will wait for user to speak and use the model to
    #  respond once they speak.
    # @param first_message_mode [Vapi::AssistantOverridesFirstMessageMode] This is the mode for the first message. Default is 'assistant-speaks-first'.
    #  Use:
    #  - 'assistant-speaks-first' to have the assistant speak first.
    #  - 'assistant-waits-for-user' to have the assistant wait for the user to speak
    #  first.
    #  - 'assistant-speaks-first-with-model-generated-message' to have the assistant
    #  speak first with a message generated by the model based on the conversation
    #  state. (`assistant.model.messages` at call start, `call.messages` at squad
    #  transfer points).
    #  @default 'assistant-speaks-first'
    # @param hipaa_enabled [Boolean] When this is enabled, no logs, recordings, or transcriptions will be stored. At
    #  the end of the call, you will still receive an end-of-call-report message to
    #  store on your server. Defaults to false.
    # @param client_messages [Array<Vapi::AssistantOverridesClientMessagesItem>] These are the messages that will be sent to your Client SDKs. Default is
    #  tatus-update,transfer-update,transcript,tool-calls,user-interrupted,voice-input.
    #  You can check the shape of the messages in ClientMessage schema.
    # @param server_messages [Array<Vapi::AssistantOverridesServerMessagesItem>] These are the messages that will be sent to your Server URL. Default is
    #  h-update,status-update,tool-calls,transfer-destination-request,user-interrupted.
    #  You can check the shape of the messages in ServerMessage schema.
    # @param silence_timeout_seconds [Float] How many seconds of silence to wait before ending the call. Defaults to 30.
    #  @default 30
    # @param max_duration_seconds [Float] This is the maximum number of seconds that the call will last. When the call
    #  reaches this duration, it will be ended.
    #  @default 600 (10 minutes)
    # @param background_sound [Vapi::AssistantOverridesBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    # @param background_denoising_enabled [Boolean] This enables filtering of noise and background speech while the user is talking.
    #  Default `false` while in beta.
    #  @default false
    # @param model_output_in_messages_enabled [Boolean] This determines whether the model's output is used in conversation history
    #  rather than the transcription of assistant's speech.
    #  Default `false` while in beta.
    #  @default false
    # @param transport_configurations [Array<Vapi::TransportConfigurationTwilio>] These are the configurations to be passed to the transport providers of
    #  assistant's calls, like Twilio. You can store multiple configurations for
    #  different transport providers. For a call, only the configuration matching the
    #  call transport provider is used.
    # @param credentials [Array<Vapi::AssistantOverridesCredentialsItem>] These are dynamic credentials that will be used for the assistant calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.
    # @param variable_values [Hash{String => Object}] These are values that will be used to replace the template variables in the
    #  assistant messages and other text-based fields.
    #  This uses LiquidJS syntax. https://liquidjs.com/tutorials/intro-to-liquid.html
    #  So for example, `{{ name }}` will be replaced with the value of `name` in
    #  `variableValues`.
    #  `{{"now" | date: "%b %d, %Y, %I:%M %p", "America/New_York"}}` will be replaced
    #  with the current date and time in New York.
    #  Some VAPI reserved defaults:
    #  - *customer* - the customer object
    # @param name [String] This is the name of the assistant.
    #  This is required when you want to transfer between assistants in a call.
    # @param voicemail_detection [Vapi::TwilioVoicemailDetection] These are the settings to configure or disable voicemail detection.
    #  Alternatively, voicemail detection can be configured using the
    #  model.tools=[VoicemailTool].
    #  This uses Twilio's built-in detection while the VoicemailTool relies on the
    #  model to detect if a voicemail was reached.
    #  You can use neither of them, one of them, or both of them. By default, Twilio
    #  built-in detection is enabled while VoicemailTool is not.
    # @param voicemail_message [String] This is the message that the assistant will say if the call is forwarded to
    #  voicemail.
    #  If unspecified, it will hang up.
    # @param end_call_message [String] This is the message that the assistant will say if it ends the call.
    #  If unspecified, it will hang up without saying anything.
    # @param end_call_phrases [Array<String>] This list contains phrases that, if spoken by the assistant, will trigger the
    #  call to be hung up. Case insensitive.
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the assistant.
    # @param analysis_plan [Vapi::AnalysisPlan] This is the plan for analysis of assistant's calls. Stored in `call.analysis`.
    # @param artifact_plan [Vapi::ArtifactPlan] This is the plan for artifacts generated during assistant's calls. Stored in
    #  `call.artifact`.
    #  Note: `recordingEnabled` is currently at the root level. It will be moved to
    #  `artifactPlan` in the future, but will remain backwards compatible.
    # @param message_plan [Vapi::MessagePlan] This is the plan for static predefined messages that can be spoken by the
    #  assistant during the call, like `idleMessages`.
    #  Note: `firstMessage`, `voicemailMessage`, and `endCallMessage` are currently at
    #  the root level. They will be moved to `messagePlan` in the future, but will
    #  remain backwards compatible.
    # @param start_speaking_plan [Vapi::StartSpeakingPlan] This is the plan for when the assistant should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.
    # @param stop_speaking_plan [Vapi::StopSpeakingPlan] This is the plan for when assistant should stop talking on customer
    #  interruption.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to recognize customer's interruption.
    #  - The assistant is too fast to recognize customer's interruption.
    #  - The assistant is getting interrupted by phrases that are just acknowledgments.
    #  - The assistant is getting interrupted by background noises.
    #  - The assistant is not properly stopping -- it starts talking right after
    #  getting interrupted.
    # @param monitor_plan [Vapi::MonitorPlan] This is the plan for real-time monitoring of the assistant's calls.
    #  Usage:
    #  - To enable live listening of the assistant's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the assistant's calls, set
    #  `monitorPlan.controlEnabled` to `true`.
    #  Note, `serverMessages`, `clientMessages`, `serverUrl` and `serverUrlSecret` are
    #  currently at the root level but will be moved to `monitorPlan` in the future.
    #  Will remain backwards compatible
    # @param credential_ids [Array<String>] These are the credentials that will be used for the assistant calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    # @param server [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server.url
    #  2. phoneNumber.serverUrl
    #  3. org.serverUrl
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantOverrides]
    def initialize(transcriber: OMIT, model: OMIT, voice: OMIT, first_message: OMIT, first_message_mode: OMIT,
                   hipaa_enabled: OMIT, client_messages: OMIT, server_messages: OMIT, silence_timeout_seconds: OMIT, max_duration_seconds: OMIT, background_sound: OMIT, background_denoising_enabled: OMIT, model_output_in_messages_enabled: OMIT, transport_configurations: OMIT, credentials: OMIT, variable_values: OMIT, name: OMIT, voicemail_detection: OMIT, voicemail_message: OMIT, end_call_message: OMIT, end_call_phrases: OMIT, metadata: OMIT, analysis_plan: OMIT, artifact_plan: OMIT, message_plan: OMIT, start_speaking_plan: OMIT, stop_speaking_plan: OMIT, monitor_plan: OMIT, credential_ids: OMIT, server: OMIT, additional_properties: nil)
      @transcriber = transcriber if transcriber != OMIT
      @model = model if model != OMIT
      @voice = voice if voice != OMIT
      @first_message = first_message if first_message != OMIT
      @first_message_mode = first_message_mode if first_message_mode != OMIT
      @hipaa_enabled = hipaa_enabled if hipaa_enabled != OMIT
      @client_messages = client_messages if client_messages != OMIT
      @server_messages = server_messages if server_messages != OMIT
      @silence_timeout_seconds = silence_timeout_seconds if silence_timeout_seconds != OMIT
      @max_duration_seconds = max_duration_seconds if max_duration_seconds != OMIT
      @background_sound = background_sound if background_sound != OMIT
      @background_denoising_enabled = background_denoising_enabled if background_denoising_enabled != OMIT
      @model_output_in_messages_enabled = model_output_in_messages_enabled if model_output_in_messages_enabled != OMIT
      @transport_configurations = transport_configurations if transport_configurations != OMIT
      @credentials = credentials if credentials != OMIT
      @variable_values = variable_values if variable_values != OMIT
      @name = name if name != OMIT
      @voicemail_detection = voicemail_detection if voicemail_detection != OMIT
      @voicemail_message = voicemail_message if voicemail_message != OMIT
      @end_call_message = end_call_message if end_call_message != OMIT
      @end_call_phrases = end_call_phrases if end_call_phrases != OMIT
      @metadata = metadata if metadata != OMIT
      @analysis_plan = analysis_plan if analysis_plan != OMIT
      @artifact_plan = artifact_plan if artifact_plan != OMIT
      @message_plan = message_plan if message_plan != OMIT
      @start_speaking_plan = start_speaking_plan if start_speaking_plan != OMIT
      @stop_speaking_plan = stop_speaking_plan if stop_speaking_plan != OMIT
      @monitor_plan = monitor_plan if monitor_plan != OMIT
      @credential_ids = credential_ids if credential_ids != OMIT
      @server = server if server != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "transcriber": transcriber,
        "model": model,
        "voice": voice,
        "firstMessage": first_message,
        "firstMessageMode": first_message_mode,
        "hipaaEnabled": hipaa_enabled,
        "clientMessages": client_messages,
        "serverMessages": server_messages,
        "silenceTimeoutSeconds": silence_timeout_seconds,
        "maxDurationSeconds": max_duration_seconds,
        "backgroundSound": background_sound,
        "backgroundDenoisingEnabled": background_denoising_enabled,
        "modelOutputInMessagesEnabled": model_output_in_messages_enabled,
        "transportConfigurations": transport_configurations,
        "credentials": credentials,
        "variableValues": variable_values,
        "name": name,
        "voicemailDetection": voicemail_detection,
        "voicemailMessage": voicemail_message,
        "endCallMessage": end_call_message,
        "endCallPhrases": end_call_phrases,
        "metadata": metadata,
        "analysisPlan": analysis_plan,
        "artifactPlan": artifact_plan,
        "messagePlan": message_plan,
        "startSpeakingPlan": start_speaking_plan,
        "stopSpeakingPlan": stop_speaking_plan,
        "monitorPlan": monitor_plan,
        "credentialIds": credential_ids,
        "server": server
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssistantOverrides
    #
    # @param json_object [String]
    # @return [Vapi::AssistantOverrides]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["transcriber"].nil?
        transcriber = nil
      else
        transcriber = parsed_json["transcriber"].to_json
        transcriber = Vapi::AssistantOverridesTranscriber.from_json(json_object: transcriber)
      end
      if parsed_json["model"].nil?
        model = nil
      else
        model = parsed_json["model"].to_json
        model = Vapi::AssistantOverridesModel.from_json(json_object: model)
      end
      if parsed_json["voice"].nil?
        voice = nil
      else
        voice = parsed_json["voice"].to_json
        voice = Vapi::AssistantOverridesVoice.from_json(json_object: voice)
      end
      first_message = parsed_json["firstMessage"]
      first_message_mode = parsed_json["firstMessageMode"]
      hipaa_enabled = parsed_json["hipaaEnabled"]
      client_messages = parsed_json["clientMessages"]
      server_messages = parsed_json["serverMessages"]
      silence_timeout_seconds = parsed_json["silenceTimeoutSeconds"]
      max_duration_seconds = parsed_json["maxDurationSeconds"]
      background_sound = parsed_json["backgroundSound"]
      background_denoising_enabled = parsed_json["backgroundDenoisingEnabled"]
      model_output_in_messages_enabled = parsed_json["modelOutputInMessagesEnabled"]
      transport_configurations = parsed_json["transportConfigurations"]&.map do |item|
        item = item.to_json
        Vapi::TransportConfigurationTwilio.from_json(json_object: item)
      end
      credentials = parsed_json["credentials"]&.map do |item|
        item = item.to_json
        Vapi::AssistantOverridesCredentialsItem.from_json(json_object: item)
      end
      variable_values = parsed_json["variableValues"]
      name = parsed_json["name"]
      if parsed_json["voicemailDetection"].nil?
        voicemail_detection = nil
      else
        voicemail_detection = parsed_json["voicemailDetection"].to_json
        voicemail_detection = Vapi::TwilioVoicemailDetection.from_json(json_object: voicemail_detection)
      end
      voicemail_message = parsed_json["voicemailMessage"]
      end_call_message = parsed_json["endCallMessage"]
      end_call_phrases = parsed_json["endCallPhrases"]
      metadata = parsed_json["metadata"]
      if parsed_json["analysisPlan"].nil?
        analysis_plan = nil
      else
        analysis_plan = parsed_json["analysisPlan"].to_json
        analysis_plan = Vapi::AnalysisPlan.from_json(json_object: analysis_plan)
      end
      if parsed_json["artifactPlan"].nil?
        artifact_plan = nil
      else
        artifact_plan = parsed_json["artifactPlan"].to_json
        artifact_plan = Vapi::ArtifactPlan.from_json(json_object: artifact_plan)
      end
      if parsed_json["messagePlan"].nil?
        message_plan = nil
      else
        message_plan = parsed_json["messagePlan"].to_json
        message_plan = Vapi::MessagePlan.from_json(json_object: message_plan)
      end
      if parsed_json["startSpeakingPlan"].nil?
        start_speaking_plan = nil
      else
        start_speaking_plan = parsed_json["startSpeakingPlan"].to_json
        start_speaking_plan = Vapi::StartSpeakingPlan.from_json(json_object: start_speaking_plan)
      end
      if parsed_json["stopSpeakingPlan"].nil?
        stop_speaking_plan = nil
      else
        stop_speaking_plan = parsed_json["stopSpeakingPlan"].to_json
        stop_speaking_plan = Vapi::StopSpeakingPlan.from_json(json_object: stop_speaking_plan)
      end
      if parsed_json["monitorPlan"].nil?
        monitor_plan = nil
      else
        monitor_plan = parsed_json["monitorPlan"].to_json
        monitor_plan = Vapi::MonitorPlan.from_json(json_object: monitor_plan)
      end
      credential_ids = parsed_json["credentialIds"]
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      new(
        transcriber: transcriber,
        model: model,
        voice: voice,
        first_message: first_message,
        first_message_mode: first_message_mode,
        hipaa_enabled: hipaa_enabled,
        client_messages: client_messages,
        server_messages: server_messages,
        silence_timeout_seconds: silence_timeout_seconds,
        max_duration_seconds: max_duration_seconds,
        background_sound: background_sound,
        background_denoising_enabled: background_denoising_enabled,
        model_output_in_messages_enabled: model_output_in_messages_enabled,
        transport_configurations: transport_configurations,
        credentials: credentials,
        variable_values: variable_values,
        name: name,
        voicemail_detection: voicemail_detection,
        voicemail_message: voicemail_message,
        end_call_message: end_call_message,
        end_call_phrases: end_call_phrases,
        metadata: metadata,
        analysis_plan: analysis_plan,
        artifact_plan: artifact_plan,
        message_plan: message_plan,
        start_speaking_plan: start_speaking_plan,
        stop_speaking_plan: stop_speaking_plan,
        monitor_plan: monitor_plan,
        credential_ids: credential_ids,
        server: server,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssistantOverrides to a JSON object
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
      obj.transcriber.nil? || Vapi::AssistantOverridesTranscriber.validate_raw(obj: obj.transcriber)
      obj.model.nil? || Vapi::AssistantOverridesModel.validate_raw(obj: obj.model)
      obj.voice.nil? || Vapi::AssistantOverridesVoice.validate_raw(obj: obj.voice)
      obj.first_message&.is_a?(String) != false || raise("Passed value for field obj.first_message is not the expected type, validation failed.")
      obj.first_message_mode&.is_a?(Vapi::AssistantOverridesFirstMessageMode) != false || raise("Passed value for field obj.first_message_mode is not the expected type, validation failed.")
      obj.hipaa_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_enabled is not the expected type, validation failed.")
      obj.client_messages&.is_a?(Array) != false || raise("Passed value for field obj.client_messages is not the expected type, validation failed.")
      obj.server_messages&.is_a?(Array) != false || raise("Passed value for field obj.server_messages is not the expected type, validation failed.")
      obj.silence_timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.silence_timeout_seconds is not the expected type, validation failed.")
      obj.max_duration_seconds&.is_a?(Float) != false || raise("Passed value for field obj.max_duration_seconds is not the expected type, validation failed.")
      obj.background_sound&.is_a?(Vapi::AssistantOverridesBackgroundSound) != false || raise("Passed value for field obj.background_sound is not the expected type, validation failed.")
      obj.background_denoising_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.background_denoising_enabled is not the expected type, validation failed.")
      obj.model_output_in_messages_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.model_output_in_messages_enabled is not the expected type, validation failed.")
      obj.transport_configurations&.is_a?(Array) != false || raise("Passed value for field obj.transport_configurations is not the expected type, validation failed.")
      obj.credentials&.is_a?(Array) != false || raise("Passed value for field obj.credentials is not the expected type, validation failed.")
      obj.variable_values&.is_a?(Hash) != false || raise("Passed value for field obj.variable_values is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.voicemail_detection.nil? || Vapi::TwilioVoicemailDetection.validate_raw(obj: obj.voicemail_detection)
      obj.voicemail_message&.is_a?(String) != false || raise("Passed value for field obj.voicemail_message is not the expected type, validation failed.")
      obj.end_call_message&.is_a?(String) != false || raise("Passed value for field obj.end_call_message is not the expected type, validation failed.")
      obj.end_call_phrases&.is_a?(Array) != false || raise("Passed value for field obj.end_call_phrases is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.analysis_plan.nil? || Vapi::AnalysisPlan.validate_raw(obj: obj.analysis_plan)
      obj.artifact_plan.nil? || Vapi::ArtifactPlan.validate_raw(obj: obj.artifact_plan)
      obj.message_plan.nil? || Vapi::MessagePlan.validate_raw(obj: obj.message_plan)
      obj.start_speaking_plan.nil? || Vapi::StartSpeakingPlan.validate_raw(obj: obj.start_speaking_plan)
      obj.stop_speaking_plan.nil? || Vapi::StopSpeakingPlan.validate_raw(obj: obj.stop_speaking_plan)
      obj.monitor_plan.nil? || Vapi::MonitorPlan.validate_raw(obj: obj.monitor_plan)
      obj.credential_ids&.is_a?(Array) != false || raise("Passed value for field obj.credential_ids is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
    end
  end
end
