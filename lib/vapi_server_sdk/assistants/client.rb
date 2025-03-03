# frozen_string_literal: true

require_relative "../../requests"
require "date"
require_relative "../types/assistant"
require "json"
require_relative "../types/create_assistant_dto"
require_relative "types/update_assistant_dto_transcriber"
require_relative "types/update_assistant_dto_model"
require_relative "types/update_assistant_dto_voice"
require_relative "types/update_assistant_dto_first_message_mode"
require_relative "types/update_assistant_dto_client_messages_item"
require_relative "types/update_assistant_dto_server_messages_item"
require_relative "types/update_assistant_dto_background_sound"
require_relative "../types/transport_configuration_twilio"
require_relative "types/update_assistant_dto_credentials_item"
require_relative "../types/twilio_voicemail_detection"
require_relative "../types/compliance_plan"
require_relative "../types/analysis_plan"
require_relative "../types/artifact_plan"
require_relative "../types/message_plan"
require_relative "../types/start_speaking_plan"
require_relative "../types/stop_speaking_plan"
require_relative "../types/monitor_plan"
require_relative "../types/server"
require_relative "../types/assistant_hooks"
require "async"

module Vapi
  class AssistantsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::AssistantsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param limit [Float] This is the maximum number of items to return. Defaults to 100.
    # @param created_at_gt [DateTime] This will return items where the createdAt is greater than the specified value.
    # @param created_at_lt [DateTime] This will return items where the createdAt is less than the specified value.
    # @param created_at_ge [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    # @param created_at_le [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    # @param updated_at_gt [DateTime] This will return items where the updatedAt is greater than the specified value.
    # @param updated_at_lt [DateTime] This will return items where the updatedAt is less than the specified value.
    # @param updated_at_ge [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    # @param updated_at_le [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Vapi::Assistant>]
    def list(limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil,
             updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "createdAtGt": created_at_gt,
          "createdAtLt": created_at_lt,
          "createdAtGe": created_at_ge,
          "createdAtLe": created_at_le,
          "updatedAtGt": updated_at_gt,
          "updatedAtLt": updated_at_lt,
          "updatedAtGe": updated_at_ge,
          "updatedAtLe": updated_at_le
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/assistant"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Vapi::Assistant.from_json(json_object: item)
      end
    end

    # @param request [Hash] Request of type Vapi::CreateAssistantDto, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_mode (Vapi::CreateAssistantDtoFirstMessageMode)
    #   * :client_messages (Array<Vapi::CreateAssistantDtoClientMessagesItem>)
    #   * :server_messages (Array<Vapi::CreateAssistantDtoServerMessagesItem>)
    #   * :silence_timeout_seconds (Float)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Vapi::CreateAssistantDtoBackgroundSound)
    #   * :background_denoising_enabled (Boolean)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :credentials (Array<Vapi::CreateAssistantDtoCredentialsItem>)
    #   * :name (String)
    #   * :voicemail_detection (Hash)
    #     * :provider (String)
    #     * :voicemail_detection_types (Array<Vapi::TwilioVoicemailDetectionVoicemailDetectionTypesItem>)
    #     * :enabled (Boolean)
    #     * :machine_detection_timeout (Float)
    #     * :machine_detection_speech_threshold (Float)
    #     * :machine_detection_speech_end_threshold (Float)
    #     * :machine_detection_silence_timeout (Float)
    #   * :voicemail_message (String)
    #   * :end_call_message (String)
    #   * :end_call_phrases (Array<String>)
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
    #   * :metadata (Hash{String => Object})
    #   * :analysis_plan (Hash)
    #     * :summary_plan (Hash)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #     * :structured_data_plan (Hash)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :schema (Hash)
    #         * :type (Vapi::JsonSchemaType)
    #         * :items (Hash{String => Object})
    #         * :properties (Hash{String => Object})
    #         * :description (String)
    #         * :required (Array<String>)
    #         * :regex (String)
    #         * :value (String)
    #         * :target (String)
    #         * :enum (Array<String>)
    #       * :timeout_seconds (Float)
    #     * :success_evaluation_plan (Hash)
    #       * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #   * :artifact_plan (Hash)
    #     * :recording_enabled (Boolean)
    #     * :video_recording_enabled (Boolean)
    #     * :pcap_enabled (Boolean)
    #     * :pcap_s_3_path_prefix (String)
    #     * :transcript_plan (Hash)
    #       * :enabled (Boolean)
    #       * :assistant_name (String)
    #       * :user_name (String)
    #     * :recording_path (String)
    #   * :message_plan (Hash)
    #     * :idle_messages (Array<String>)
    #     * :idle_message_max_spoken_count (Float)
    #     * :idle_timeout_seconds (Float)
    #     * :silence_timeout_message (String)
    #   * :start_speaking_plan (Hash)
    #     * :wait_seconds (Float)
    #     * :smart_endpointing_enabled (Boolean)
    #     * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #     * :transcription_endpointing_plan (Hash)
    #       * :on_punctuation_seconds (Float)
    #       * :on_no_punctuation_seconds (Float)
    #       * :on_number_seconds (Float)
    #   * :stop_speaking_plan (Hash)
    #     * :num_words (Float)
    #     * :voice_seconds (Float)
    #     * :backoff_seconds (Float)
    #     * :acknowledgement_phrases (Array<String>)
    #     * :interruption_phrases (Array<String>)
    #   * :monitor_plan (Hash)
    #     * :listen_enabled (Boolean)
    #     * :control_enabled (Boolean)
    #   * :credential_ids (Array<String>)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :url (String)
    #     * :secret (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :max_retries (Float)
    #       * :type (Hash{String => Object})
    #       * :base_delay_seconds (Float)
    #   * :hooks (Array<Vapi::AssistantHooks>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def create(request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/assistant"
      end
      Vapi::Assistant.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def get(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/assistant/#{id}"
      end
      Vapi::Assistant.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def delete(id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/assistant/#{id}"
      end
      Vapi::Assistant.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param transcriber [Vapi::Assistants::UpdateAssistantDtoTranscriber] These are the options for the assistant's transcriber.
    # @param model [Vapi::Assistants::UpdateAssistantDtoModel] These are the options for the assistant's LLM.
    # @param voice [Vapi::Assistants::UpdateAssistantDtoVoice] These are the options for the assistant's voice.
    # @param first_message [String] This is the first message that the assistant will say. This can also be a URL to
    #  a containerized audio file (mp3, wav, etc.).
    #  If unspecified, assistant will wait for user to speak and use the model to
    #  respond once they speak.
    # @param first_message_mode [Vapi::Assistants::UpdateAssistantDtoFirstMessageMode] This is the mode for the first message. Default is 'assistant-speaks-first'.
    #  Use:
    #  - 'assistant-speaks-first' to have the assistant speak first.
    #  - 'assistant-waits-for-user' to have the assistant wait for the user to speak
    #  first.
    #  - 'assistant-speaks-first-with-model-generated-message' to have the assistant
    #  speak first with a message generated by the model based on the conversation
    #  state. (`assistant.model.messages` at call start, `call.messages` at squad
    #  transfer points).
    #  @default 'assistant-speaks-first'
    # @param client_messages [Array<Vapi::Assistants::UpdateAssistantDtoClientMessagesItem>] These are the messages that will be sent to your Client SDKs. Default is
    #  tatus-update,transfer-update,transcript,tool-calls,user-interrupted,voice-input.
    #  You can check the shape of the messages in ClientMessage schema.
    # @param server_messages [Array<Vapi::Assistants::UpdateAssistantDtoServerMessagesItem>] These are the messages that will be sent to your Server URL. Default is
    #  h-update,status-update,tool-calls,transfer-destination-request,user-interrupted.
    #  You can check the shape of the messages in ServerMessage schema.
    # @param silence_timeout_seconds [Float] How many seconds of silence to wait before ending the call. Defaults to 30.
    #  @default 30
    # @param max_duration_seconds [Float] This is the maximum number of seconds that the call will last. When the call
    #  reaches this duration, it will be ended.
    #  @default 600 (10 minutes)
    # @param background_sound [Vapi::Assistants::UpdateAssistantDtoBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    # @param background_denoising_enabled [Boolean] This enables filtering of noise and background speech while the user is talking.
    #  Default `false` while in beta.
    #  @default false
    # @param model_output_in_messages_enabled [Boolean] This determines whether the model's output is used in conversation history
    #  rather than the transcription of assistant's speech.
    #  Default `false` while in beta.
    #  @default false
    # @param transport_configurations [Array<Hash>] These are the configurations to be passed to the transport providers of
    #  assistant's calls, like Twilio. You can store multiple configurations for
    #  different transport providers. For a call, only the configuration matching the
    #  call transport provider is used.Request of type Array<Vapi::TransportConfigurationTwilio>, as a Hash
    #   * :provider (String)
    #   * :timeout (Float)
    #   * :record (Boolean)
    #   * :recording_channels (Vapi::TransportConfigurationTwilioRecordingChannels)
    # @param credentials [Array<Hash>] These are dynamic credentials that will be used for the assistant calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.Request of type Array<Vapi::Assistants::UpdateAssistantDtoCredentialsItem>, as a Hash
    # @param name [String] This is the name of the assistant.
    #  This is required when you want to transfer between assistants in a call.
    # @param voicemail_detection [Hash] These are the settings to configure or disable voicemail detection.
    #  Alternatively, voicemail detection can be configured using the
    #  model.tools=[VoicemailTool].
    #  This uses Twilio's built-in detection while the VoicemailTool relies on the
    #  model to detect if a voicemail was reached.
    #  You can use neither of them, one of them, or both of them. By default, Twilio
    #  built-in detection is enabled while VoicemailTool is not.Request of type Vapi::TwilioVoicemailDetection, as a Hash
    #   * :provider (String)
    #   * :voicemail_detection_types (Array<Vapi::TwilioVoicemailDetectionVoicemailDetectionTypesItem>)
    #   * :enabled (Boolean)
    #   * :machine_detection_timeout (Float)
    #   * :machine_detection_speech_threshold (Float)
    #   * :machine_detection_speech_end_threshold (Float)
    #   * :machine_detection_silence_timeout (Float)
    # @param voicemail_message [String] This is the message that the assistant will say if the call is forwarded to
    #  voicemail.
    #  If unspecified, it will hang up.
    # @param end_call_message [String] This is the message that the assistant will say if it ends the call.
    #  If unspecified, it will hang up without saying anything.
    # @param end_call_phrases [Array<String>] This list contains phrases that, if spoken by the assistant, will trigger the
    #  call to be hung up. Case insensitive.
    # @param compliance_plan [Hash] Request of type Vapi::CompliancePlan, as a Hash
    #   * :hipaa_enabled (Boolean)
    #   * :pci_enabled (Boolean)
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the assistant.
    # @param analysis_plan [Hash] This is the plan for analysis of assistant's calls. Stored in `call.analysis`.Request of type Vapi::AnalysisPlan, as a Hash
    #   * :summary_plan (Hash)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    #   * :structured_data_plan (Hash)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :schema (Hash)
    #       * :type (Vapi::JsonSchemaType)
    #       * :items (Hash{String => Object})
    #       * :properties (Hash{String => Object})
    #       * :description (String)
    #       * :required (Array<String>)
    #       * :regex (String)
    #       * :value (String)
    #       * :target (String)
    #       * :enum (Array<String>)
    #     * :timeout_seconds (Float)
    #   * :success_evaluation_plan (Hash)
    #     * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    # @param artifact_plan [Hash] This is the plan for artifacts generated during assistant's calls. Stored in
    #  `call.artifact`.
    #  Note: `recordingEnabled` is currently at the root level. It will be moved to
    #  `artifactPlan` in the future, but will remain backwards compatible.Request of type Vapi::ArtifactPlan, as a Hash
    #   * :recording_enabled (Boolean)
    #   * :video_recording_enabled (Boolean)
    #   * :pcap_enabled (Boolean)
    #   * :pcap_s_3_path_prefix (String)
    #   * :transcript_plan (Hash)
    #     * :enabled (Boolean)
    #     * :assistant_name (String)
    #     * :user_name (String)
    #   * :recording_path (String)
    # @param message_plan [Hash] This is the plan for static predefined messages that can be spoken by the
    #  assistant during the call, like `idleMessages`.
    #  Note: `firstMessage`, `voicemailMessage`, and `endCallMessage` are currently at
    #  the root level. They will be moved to `messagePlan` in the future, but will
    #  remain backwards compatible.Request of type Vapi::MessagePlan, as a Hash
    #   * :idle_messages (Array<String>)
    #   * :idle_message_max_spoken_count (Float)
    #   * :idle_timeout_seconds (Float)
    #   * :silence_timeout_message (String)
    # @param start_speaking_plan [Hash] This is the plan for when the assistant should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.Request of type Vapi::StartSpeakingPlan, as a Hash
    #   * :wait_seconds (Float)
    #   * :smart_endpointing_enabled (Boolean)
    #   * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #   * :transcription_endpointing_plan (Hash)
    #     * :on_punctuation_seconds (Float)
    #     * :on_no_punctuation_seconds (Float)
    #     * :on_number_seconds (Float)
    # @param stop_speaking_plan [Hash] This is the plan for when assistant should stop talking on customer
    #  interruption.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to recognize customer's interruption.
    #  - The assistant is too fast to recognize customer's interruption.
    #  - The assistant is getting interrupted by phrases that are just acknowledgments.
    #  - The assistant is getting interrupted by background noises.
    #  - The assistant is not properly stopping -- it starts talking right after
    #  getting interrupted.Request of type Vapi::StopSpeakingPlan, as a Hash
    #   * :num_words (Float)
    #   * :voice_seconds (Float)
    #   * :backoff_seconds (Float)
    #   * :acknowledgement_phrases (Array<String>)
    #   * :interruption_phrases (Array<String>)
    # @param monitor_plan [Hash] This is the plan for real-time monitoring of the assistant's calls.
    #  Usage:
    #  - To enable live listening of the assistant's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the assistant's calls, set
    #  `monitorPlan.controlEnabled` to `true`.
    #  Note, `serverMessages`, `clientMessages`, `serverUrl` and `serverUrlSecret` are
    #  currently at the root level but will be moved to `monitorPlan` in the future.
    #  Will remain backwards compatibleRequest of type Vapi::MonitorPlan, as a Hash
    #   * :listen_enabled (Boolean)
    #   * :control_enabled (Boolean)
    # @param credential_ids [Array<String>] These are the credentials that will be used for the assistant calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    # @param server [Hash] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server.url
    #  2. phoneNumber.serverUrl
    #  3. org.serverUrlRequest of type Vapi::Server, as a Hash
    #   * :timeout_seconds (Float)
    #   * :url (String)
    #   * :secret (String)
    #   * :headers (Hash{String => Object})
    #   * :backoff_plan (Hash)
    #     * :max_retries (Float)
    #     * :type (Hash{String => Object})
    #     * :base_delay_seconds (Float)
    # @param hooks [Array<Hash>] This is a set of actions that will be performed on certain events.Request of type Array<Vapi::AssistantHooks>, as a Hash
    #   * :on (String)
    #   * :filters (Array<Vapi::AssistantHookFilter>)
    #   * :do_ (Array<Vapi::AssistantHookActionBase>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def update(id:, transcriber: nil, model: nil, voice: nil, first_message: nil, first_message_mode: nil,
               client_messages: nil, server_messages: nil, silence_timeout_seconds: nil, max_duration_seconds: nil, background_sound: nil, background_denoising_enabled: nil, model_output_in_messages_enabled: nil, transport_configurations: nil, credentials: nil, name: nil, voicemail_detection: nil, voicemail_message: nil, end_call_message: nil, end_call_phrases: nil, compliance_plan: nil, metadata: nil, analysis_plan: nil, artifact_plan: nil, message_plan: nil, start_speaking_plan: nil, stop_speaking_plan: nil, monitor_plan: nil, credential_ids: nil, server: nil, hooks: nil, request_options: nil)
      response = @request_client.conn.patch do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          transcriber: transcriber,
          model: model,
          voice: voice,
          firstMessage: first_message,
          firstMessageMode: first_message_mode,
          clientMessages: client_messages,
          serverMessages: server_messages,
          silenceTimeoutSeconds: silence_timeout_seconds,
          maxDurationSeconds: max_duration_seconds,
          backgroundSound: background_sound,
          backgroundDenoisingEnabled: background_denoising_enabled,
          modelOutputInMessagesEnabled: model_output_in_messages_enabled,
          transportConfigurations: transport_configurations,
          credentials: credentials,
          name: name,
          voicemailDetection: voicemail_detection,
          voicemailMessage: voicemail_message,
          endCallMessage: end_call_message,
          endCallPhrases: end_call_phrases,
          compliancePlan: compliance_plan,
          metadata: metadata,
          analysisPlan: analysis_plan,
          artifactPlan: artifact_plan,
          messagePlan: message_plan,
          startSpeakingPlan: start_speaking_plan,
          stopSpeakingPlan: stop_speaking_plan,
          monitorPlan: monitor_plan,
          credentialIds: credential_ids,
          server: server,
          hooks: hooks
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/assistant/#{id}"
      end
      Vapi::Assistant.from_json(json_object: response.body)
    end
  end

  class AsyncAssistantsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncAssistantsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param limit [Float] This is the maximum number of items to return. Defaults to 100.
    # @param created_at_gt [DateTime] This will return items where the createdAt is greater than the specified value.
    # @param created_at_lt [DateTime] This will return items where the createdAt is less than the specified value.
    # @param created_at_ge [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    # @param created_at_le [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    # @param updated_at_gt [DateTime] This will return items where the updatedAt is greater than the specified value.
    # @param updated_at_lt [DateTime] This will return items where the updatedAt is less than the specified value.
    # @param updated_at_ge [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    # @param updated_at_le [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Vapi::Assistant>]
    def list(limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil,
             updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "limit": limit,
            "createdAtGt": created_at_gt,
            "createdAtLt": created_at_lt,
            "createdAtGe": created_at_ge,
            "createdAtLe": created_at_le,
            "updatedAtGt": updated_at_gt,
            "updatedAtLt": updated_at_lt,
            "updatedAtGe": updated_at_ge,
            "updatedAtLe": updated_at_le
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/assistant"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Vapi::Assistant.from_json(json_object: item)
        end
      end
    end

    # @param request [Hash] Request of type Vapi::CreateAssistantDto, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_mode (Vapi::CreateAssistantDtoFirstMessageMode)
    #   * :client_messages (Array<Vapi::CreateAssistantDtoClientMessagesItem>)
    #   * :server_messages (Array<Vapi::CreateAssistantDtoServerMessagesItem>)
    #   * :silence_timeout_seconds (Float)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Vapi::CreateAssistantDtoBackgroundSound)
    #   * :background_denoising_enabled (Boolean)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :credentials (Array<Vapi::CreateAssistantDtoCredentialsItem>)
    #   * :name (String)
    #   * :voicemail_detection (Hash)
    #     * :provider (String)
    #     * :voicemail_detection_types (Array<Vapi::TwilioVoicemailDetectionVoicemailDetectionTypesItem>)
    #     * :enabled (Boolean)
    #     * :machine_detection_timeout (Float)
    #     * :machine_detection_speech_threshold (Float)
    #     * :machine_detection_speech_end_threshold (Float)
    #     * :machine_detection_silence_timeout (Float)
    #   * :voicemail_message (String)
    #   * :end_call_message (String)
    #   * :end_call_phrases (Array<String>)
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
    #   * :metadata (Hash{String => Object})
    #   * :analysis_plan (Hash)
    #     * :summary_plan (Hash)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #     * :structured_data_plan (Hash)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :schema (Hash)
    #         * :type (Vapi::JsonSchemaType)
    #         * :items (Hash{String => Object})
    #         * :properties (Hash{String => Object})
    #         * :description (String)
    #         * :required (Array<String>)
    #         * :regex (String)
    #         * :value (String)
    #         * :target (String)
    #         * :enum (Array<String>)
    #       * :timeout_seconds (Float)
    #     * :success_evaluation_plan (Hash)
    #       * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #   * :artifact_plan (Hash)
    #     * :recording_enabled (Boolean)
    #     * :video_recording_enabled (Boolean)
    #     * :pcap_enabled (Boolean)
    #     * :pcap_s_3_path_prefix (String)
    #     * :transcript_plan (Hash)
    #       * :enabled (Boolean)
    #       * :assistant_name (String)
    #       * :user_name (String)
    #     * :recording_path (String)
    #   * :message_plan (Hash)
    #     * :idle_messages (Array<String>)
    #     * :idle_message_max_spoken_count (Float)
    #     * :idle_timeout_seconds (Float)
    #     * :silence_timeout_message (String)
    #   * :start_speaking_plan (Hash)
    #     * :wait_seconds (Float)
    #     * :smart_endpointing_enabled (Boolean)
    #     * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #     * :transcription_endpointing_plan (Hash)
    #       * :on_punctuation_seconds (Float)
    #       * :on_no_punctuation_seconds (Float)
    #       * :on_number_seconds (Float)
    #   * :stop_speaking_plan (Hash)
    #     * :num_words (Float)
    #     * :voice_seconds (Float)
    #     * :backoff_seconds (Float)
    #     * :acknowledgement_phrases (Array<String>)
    #     * :interruption_phrases (Array<String>)
    #   * :monitor_plan (Hash)
    #     * :listen_enabled (Boolean)
    #     * :control_enabled (Boolean)
    #   * :credential_ids (Array<String>)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :url (String)
    #     * :secret (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :max_retries (Float)
    #       * :type (Hash{String => Object})
    #       * :base_delay_seconds (Float)
    #   * :hooks (Array<Vapi::AssistantHooks>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def create(request:, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/assistant"
        end
        Vapi::Assistant.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def get(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/assistant/#{id}"
        end
        Vapi::Assistant.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def delete(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/assistant/#{id}"
        end
        Vapi::Assistant.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param transcriber [Vapi::Assistants::UpdateAssistantDtoTranscriber] These are the options for the assistant's transcriber.
    # @param model [Vapi::Assistants::UpdateAssistantDtoModel] These are the options for the assistant's LLM.
    # @param voice [Vapi::Assistants::UpdateAssistantDtoVoice] These are the options for the assistant's voice.
    # @param first_message [String] This is the first message that the assistant will say. This can also be a URL to
    #  a containerized audio file (mp3, wav, etc.).
    #  If unspecified, assistant will wait for user to speak and use the model to
    #  respond once they speak.
    # @param first_message_mode [Vapi::Assistants::UpdateAssistantDtoFirstMessageMode] This is the mode for the first message. Default is 'assistant-speaks-first'.
    #  Use:
    #  - 'assistant-speaks-first' to have the assistant speak first.
    #  - 'assistant-waits-for-user' to have the assistant wait for the user to speak
    #  first.
    #  - 'assistant-speaks-first-with-model-generated-message' to have the assistant
    #  speak first with a message generated by the model based on the conversation
    #  state. (`assistant.model.messages` at call start, `call.messages` at squad
    #  transfer points).
    #  @default 'assistant-speaks-first'
    # @param client_messages [Array<Vapi::Assistants::UpdateAssistantDtoClientMessagesItem>] These are the messages that will be sent to your Client SDKs. Default is
    #  tatus-update,transfer-update,transcript,tool-calls,user-interrupted,voice-input.
    #  You can check the shape of the messages in ClientMessage schema.
    # @param server_messages [Array<Vapi::Assistants::UpdateAssistantDtoServerMessagesItem>] These are the messages that will be sent to your Server URL. Default is
    #  h-update,status-update,tool-calls,transfer-destination-request,user-interrupted.
    #  You can check the shape of the messages in ServerMessage schema.
    # @param silence_timeout_seconds [Float] How many seconds of silence to wait before ending the call. Defaults to 30.
    #  @default 30
    # @param max_duration_seconds [Float] This is the maximum number of seconds that the call will last. When the call
    #  reaches this duration, it will be ended.
    #  @default 600 (10 minutes)
    # @param background_sound [Vapi::Assistants::UpdateAssistantDtoBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    # @param background_denoising_enabled [Boolean] This enables filtering of noise and background speech while the user is talking.
    #  Default `false` while in beta.
    #  @default false
    # @param model_output_in_messages_enabled [Boolean] This determines whether the model's output is used in conversation history
    #  rather than the transcription of assistant's speech.
    #  Default `false` while in beta.
    #  @default false
    # @param transport_configurations [Array<Hash>] These are the configurations to be passed to the transport providers of
    #  assistant's calls, like Twilio. You can store multiple configurations for
    #  different transport providers. For a call, only the configuration matching the
    #  call transport provider is used.Request of type Array<Vapi::TransportConfigurationTwilio>, as a Hash
    #   * :provider (String)
    #   * :timeout (Float)
    #   * :record (Boolean)
    #   * :recording_channels (Vapi::TransportConfigurationTwilioRecordingChannels)
    # @param credentials [Array<Hash>] These are dynamic credentials that will be used for the assistant calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.Request of type Array<Vapi::Assistants::UpdateAssistantDtoCredentialsItem>, as a Hash
    # @param name [String] This is the name of the assistant.
    #  This is required when you want to transfer between assistants in a call.
    # @param voicemail_detection [Hash] These are the settings to configure or disable voicemail detection.
    #  Alternatively, voicemail detection can be configured using the
    #  model.tools=[VoicemailTool].
    #  This uses Twilio's built-in detection while the VoicemailTool relies on the
    #  model to detect if a voicemail was reached.
    #  You can use neither of them, one of them, or both of them. By default, Twilio
    #  built-in detection is enabled while VoicemailTool is not.Request of type Vapi::TwilioVoicemailDetection, as a Hash
    #   * :provider (String)
    #   * :voicemail_detection_types (Array<Vapi::TwilioVoicemailDetectionVoicemailDetectionTypesItem>)
    #   * :enabled (Boolean)
    #   * :machine_detection_timeout (Float)
    #   * :machine_detection_speech_threshold (Float)
    #   * :machine_detection_speech_end_threshold (Float)
    #   * :machine_detection_silence_timeout (Float)
    # @param voicemail_message [String] This is the message that the assistant will say if the call is forwarded to
    #  voicemail.
    #  If unspecified, it will hang up.
    # @param end_call_message [String] This is the message that the assistant will say if it ends the call.
    #  If unspecified, it will hang up without saying anything.
    # @param end_call_phrases [Array<String>] This list contains phrases that, if spoken by the assistant, will trigger the
    #  call to be hung up. Case insensitive.
    # @param compliance_plan [Hash] Request of type Vapi::CompliancePlan, as a Hash
    #   * :hipaa_enabled (Boolean)
    #   * :pci_enabled (Boolean)
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the assistant.
    # @param analysis_plan [Hash] This is the plan for analysis of assistant's calls. Stored in `call.analysis`.Request of type Vapi::AnalysisPlan, as a Hash
    #   * :summary_plan (Hash)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    #   * :structured_data_plan (Hash)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :schema (Hash)
    #       * :type (Vapi::JsonSchemaType)
    #       * :items (Hash{String => Object})
    #       * :properties (Hash{String => Object})
    #       * :description (String)
    #       * :required (Array<String>)
    #       * :regex (String)
    #       * :value (String)
    #       * :target (String)
    #       * :enum (Array<String>)
    #     * :timeout_seconds (Float)
    #   * :success_evaluation_plan (Hash)
    #     * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    # @param artifact_plan [Hash] This is the plan for artifacts generated during assistant's calls. Stored in
    #  `call.artifact`.
    #  Note: `recordingEnabled` is currently at the root level. It will be moved to
    #  `artifactPlan` in the future, but will remain backwards compatible.Request of type Vapi::ArtifactPlan, as a Hash
    #   * :recording_enabled (Boolean)
    #   * :video_recording_enabled (Boolean)
    #   * :pcap_enabled (Boolean)
    #   * :pcap_s_3_path_prefix (String)
    #   * :transcript_plan (Hash)
    #     * :enabled (Boolean)
    #     * :assistant_name (String)
    #     * :user_name (String)
    #   * :recording_path (String)
    # @param message_plan [Hash] This is the plan for static predefined messages that can be spoken by the
    #  assistant during the call, like `idleMessages`.
    #  Note: `firstMessage`, `voicemailMessage`, and `endCallMessage` are currently at
    #  the root level. They will be moved to `messagePlan` in the future, but will
    #  remain backwards compatible.Request of type Vapi::MessagePlan, as a Hash
    #   * :idle_messages (Array<String>)
    #   * :idle_message_max_spoken_count (Float)
    #   * :idle_timeout_seconds (Float)
    #   * :silence_timeout_message (String)
    # @param start_speaking_plan [Hash] This is the plan for when the assistant should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.Request of type Vapi::StartSpeakingPlan, as a Hash
    #   * :wait_seconds (Float)
    #   * :smart_endpointing_enabled (Boolean)
    #   * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #   * :transcription_endpointing_plan (Hash)
    #     * :on_punctuation_seconds (Float)
    #     * :on_no_punctuation_seconds (Float)
    #     * :on_number_seconds (Float)
    # @param stop_speaking_plan [Hash] This is the plan for when assistant should stop talking on customer
    #  interruption.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to recognize customer's interruption.
    #  - The assistant is too fast to recognize customer's interruption.
    #  - The assistant is getting interrupted by phrases that are just acknowledgments.
    #  - The assistant is getting interrupted by background noises.
    #  - The assistant is not properly stopping -- it starts talking right after
    #  getting interrupted.Request of type Vapi::StopSpeakingPlan, as a Hash
    #   * :num_words (Float)
    #   * :voice_seconds (Float)
    #   * :backoff_seconds (Float)
    #   * :acknowledgement_phrases (Array<String>)
    #   * :interruption_phrases (Array<String>)
    # @param monitor_plan [Hash] This is the plan for real-time monitoring of the assistant's calls.
    #  Usage:
    #  - To enable live listening of the assistant's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the assistant's calls, set
    #  `monitorPlan.controlEnabled` to `true`.
    #  Note, `serverMessages`, `clientMessages`, `serverUrl` and `serverUrlSecret` are
    #  currently at the root level but will be moved to `monitorPlan` in the future.
    #  Will remain backwards compatibleRequest of type Vapi::MonitorPlan, as a Hash
    #   * :listen_enabled (Boolean)
    #   * :control_enabled (Boolean)
    # @param credential_ids [Array<String>] These are the credentials that will be used for the assistant calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    # @param server [Hash] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server.url
    #  2. phoneNumber.serverUrl
    #  3. org.serverUrlRequest of type Vapi::Server, as a Hash
    #   * :timeout_seconds (Float)
    #   * :url (String)
    #   * :secret (String)
    #   * :headers (Hash{String => Object})
    #   * :backoff_plan (Hash)
    #     * :max_retries (Float)
    #     * :type (Hash{String => Object})
    #     * :base_delay_seconds (Float)
    # @param hooks [Array<Hash>] This is a set of actions that will be performed on certain events.Request of type Array<Vapi::AssistantHooks>, as a Hash
    #   * :on (String)
    #   * :filters (Array<Vapi::AssistantHookFilter>)
    #   * :do_ (Array<Vapi::AssistantHookActionBase>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Assistant]
    def update(id:, transcriber: nil, model: nil, voice: nil, first_message: nil, first_message_mode: nil,
               client_messages: nil, server_messages: nil, silence_timeout_seconds: nil, max_duration_seconds: nil, background_sound: nil, background_denoising_enabled: nil, model_output_in_messages_enabled: nil, transport_configurations: nil, credentials: nil, name: nil, voicemail_detection: nil, voicemail_message: nil, end_call_message: nil, end_call_phrases: nil, compliance_plan: nil, metadata: nil, analysis_plan: nil, artifact_plan: nil, message_plan: nil, start_speaking_plan: nil, stop_speaking_plan: nil, monitor_plan: nil, credential_ids: nil, server: nil, hooks: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            transcriber: transcriber,
            model: model,
            voice: voice,
            firstMessage: first_message,
            firstMessageMode: first_message_mode,
            clientMessages: client_messages,
            serverMessages: server_messages,
            silenceTimeoutSeconds: silence_timeout_seconds,
            maxDurationSeconds: max_duration_seconds,
            backgroundSound: background_sound,
            backgroundDenoisingEnabled: background_denoising_enabled,
            modelOutputInMessagesEnabled: model_output_in_messages_enabled,
            transportConfigurations: transport_configurations,
            credentials: credentials,
            name: name,
            voicemailDetection: voicemail_detection,
            voicemailMessage: voicemail_message,
            endCallMessage: end_call_message,
            endCallPhrases: end_call_phrases,
            compliancePlan: compliance_plan,
            metadata: metadata,
            analysisPlan: analysis_plan,
            artifactPlan: artifact_plan,
            messagePlan: message_plan,
            startSpeakingPlan: start_speaking_plan,
            stopSpeakingPlan: stop_speaking_plan,
            monitorPlan: monitor_plan,
            credentialIds: credential_ids,
            server: server,
            hooks: hooks
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/assistant/#{id}"
        end
        Vapi::Assistant.from_json(json_object: response.body)
      end
    end
  end
end
