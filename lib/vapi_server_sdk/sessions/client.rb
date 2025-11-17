# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_sessions_request_sort_order"
require "date"
require_relative "../types/session_paginated_response"
require_relative "types/create_session_dto_status"
require_relative "../types/create_assistant_dto"
require_relative "../types/create_squad_dto"
require_relative "types/create_session_dto_messages_item"
require_relative "../types/create_customer_dto"
require_relative "../types/import_twilio_phone_number_dto"
require_relative "../types/session"
require_relative "types/update_session_dto_status"
require_relative "types/update_session_dto_messages_item"
require "async"

module Vapi
  class SessionsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::SessionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param name [String] This is the name of the customer. This is just for your own reference.
    #  For SIP inbound calls, this is extracted from the `From` SIP header with format
    #  `"Display Name" <sip:username@domain>`.
    # @param assistant_id [String] This is the ID of the assistant to filter sessions by.
    # @param squad_id [String] This is the ID of the squad to filter sessions by.
    # @param workflow_id [String] This is the ID of the workflow to filter sessions by.
    # @param number_e_164_check_enabled [Boolean] This is the flag to toggle the E164 check for the `number` field. This is an
    #  advanced property which should be used if you know your use case requires it.
    #  Use cases:
    #  - `false`: To allow non-E164 numbers like `+001234567890`, `1234`, or `abc`.
    #  This is useful for dialing out to non-E164 numbers on your SIP trunks.
    #  - `true` (default): To allow only E164 numbers like `+14155551234`. This is
    #  standard for PSTN calls.
    #  If `false`, the `number` is still required to only contain alphanumeric
    #  characters (regex: `/^\+?[a-zA-Z0-9]+$/`).
    #  @default true (E164 check is enabled)
    # @param extension [String] This is the extension that will be dialed after the call is answered.
    # @param assistant_overrides [String] These are the overrides for the assistant's settings and template variables
    #  specific to this customer.
    #  This allows customization of the assistant's behavior for individual customers
    #  in batch calls.
    # @param number [String] This is the number of the customer.
    # @param sip_uri [String] This is the SIP URI of the customer.
    # @param email [String] This is the email of the customer.
    # @param external_id [String] This is the external ID of the customer.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Sessions::ListSessionsRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::SessionPaginatedResponse]
    def list(name: nil, assistant_id: nil, squad_id: nil, workflow_id: nil, number_e_164_check_enabled: nil,
             extension: nil, assistant_overrides: nil, number: nil, sip_uri: nil, email: nil, external_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          "name": name,
          "assistantId": assistant_id,
          "squadId": squad_id,
          "workflowId": workflow_id,
          "numberE164CheckEnabled": number_e_164_check_enabled,
          "extension": extension,
          "assistantOverrides": assistant_overrides,
          "number": number,
          "sipUri": sip_uri,
          "email": email,
          "externalId": external_id,
          "page": page,
          "sortOrder": sort_order,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/session"
      end
      Vapi::SessionPaginatedResponse.from_json(json_object: response.body)
    end

    # @param name [String] This is a user-defined name for the session. Maximum length is 40 characters.
    # @param status [Vapi::Sessions::CreateSessionDtoStatus] This is the current status of the session. Can be either 'active' or
    #  'completed'.
    # @param expiration_seconds [Float] Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not
    #  set.
    # @param assistant_id [String] This is the ID of the assistant associated with this session. Use this when
    #  referencing an existing assistant.
    # @param assistant [Hash] This is the assistant configuration for this session. Use this when creating a
    #  new assistant configuration.
    #  If assistantId is provided, this will be ignored.Request of type Vapi::CreateAssistantDto, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::CreateAssistantDtoFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::CreateAssistantDtoClientMessagesItem>)
    #   * :server_messages (Array<Vapi::CreateAssistantDtoServerMessagesItem>)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Hash)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :credentials (Array<Vapi::CreateAssistantDtoCredentialsItem>)
    #   * :hooks (Array<Vapi::CreateAssistantDtoHooksItem>)
    #   * :name (String)
    #   * :voicemail_message (String)
    #   * :end_call_message (String)
    #   * :end_call_phrases (Array<String>)
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
    #     * :security_filter_plan (Hash)
    #       * :enabled (Boolean)
    #       * :filters (Array<Vapi::SecurityFilterBase>)
    #       * :mode (Vapi::SecurityFilterPlanMode)
    #       * :replacement_text (String)
    #     * :recording_consent_plan (Hash)
    #   * :metadata (Hash{String => Object})
    #   * :background_speech_denoising_plan (Hash)
    #     * :smart_denoising_plan (Hash)
    #       * :enabled (Boolean)
    #     * :fourier_denoising_plan (Hash)
    #       * :enabled (Boolean)
    #       * :media_detection_enabled (Boolean)
    #       * :static_threshold (Float)
    #       * :baseline_offset_db (Float)
    #       * :window_size_ms (Float)
    #       * :baseline_percentile (Float)
    #   * :analysis_plan (Hash)
    #     * :min_messages_threshold (Float)
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
    #         * :pattern (String)
    #         * :format (Vapi::JsonSchemaFormat)
    #         * :required (Array<String>)
    #         * :enum (Array<String>)
    #         * :title (String)
    #       * :timeout_seconds (Float)
    #     * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #     * :success_evaluation_plan (Hash)
    #       * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #     * :outcome_ids (Array<String>)
    #   * :artifact_plan (Hash)
    #     * :recording_enabled (Boolean)
    #     * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #     * :recording_use_custom_storage_enabled (Boolean)
    #     * :video_recording_enabled (Boolean)
    #     * :full_message_history_enabled (Boolean)
    #     * :pcap_enabled (Boolean)
    #     * :pcap_s_3_path_prefix (String)
    #     * :pcap_use_custom_storage_enabled (Boolean)
    #     * :logging_enabled (Boolean)
    #     * :logging_use_custom_storage_enabled (Boolean)
    #     * :transcript_plan (Hash)
    #       * :enabled (Boolean)
    #       * :assistant_name (String)
    #       * :user_name (String)
    #     * :recording_path (String)
    #     * :structured_output_ids (Array<String>)
    #     * :scorecard_ids (Array<String>)
    #     * :scorecards (Array<Vapi::CreateScorecardDto>)
    #     * :logging_path (String)
    #   * :start_speaking_plan (Hash)
    #     * :wait_seconds (Float)
    #     * :smart_endpointing_enabled (Hash)
    #     * :smart_endpointing_plan (Hash)
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
    #     * :listen_authentication_enabled (Boolean)
    #     * :control_enabled (Boolean)
    #     * :control_authentication_enabled (Boolean)
    #   * :credential_ids (Array<String>)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :credential_id (String)
    #     * :static_ip_addresses_enabled (Boolean)
    #     * :url (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object})
    #       * :max_retries (Float)
    #       * :base_delay_seconds (Float)
    #       * :excluded_status_codes (Array<Hash{String => Object}>)
    #   * :keypad_input_plan (Hash)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    #     * :delimiters (Vapi::KeypadInputPlanDelimiters)
    # @param squad_id [String] This is the squad ID associated with this session. Use this when referencing an
    #  existing squad.
    # @param squad [Hash] This is the squad configuration for this session. Use this when creating a new
    #  squad configuration.
    #  If squadId is provided, this will be ignored.Request of type Vapi::CreateSquadDto, as a Hash
    #   * :name (String)
    #   * :members (Array<Vapi::SquadMemberDto>)
    #   * :members_overrides (Hash)
    #     * :transcriber (Hash)
    #     * :model (Hash)
    #     * :voice (Hash)
    #     * :first_message (String)
    #     * :first_message_interruptions_enabled (Boolean)
    #     * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #     * :voicemail_detection (Hash)
    #     * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #     * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #     * :max_duration_seconds (Float)
    #     * :background_sound (Hash)
    #     * :model_output_in_messages_enabled (Boolean)
    #     * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #     * :observability_plan (Hash)
    #       * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #       * :tags (Array<String>)
    #       * :metadata (Hash{String => Object})
    #     * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #     * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #     * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #     * :variable_values (Hash{String => Object})
    #     * :name (String)
    #     * :voicemail_message (String)
    #     * :end_call_message (String)
    #     * :end_call_phrases (Array<String>)
    #     * :compliance_plan (Hash)
    #       * :hipaa_enabled (Boolean)
    #       * :pci_enabled (Boolean)
    #       * :security_filter_plan (Hash)
    #         * :enabled (Boolean)
    #         * :filters (Array<Vapi::SecurityFilterBase>)
    #         * :mode (Vapi::SecurityFilterPlanMode)
    #         * :replacement_text (String)
    #       * :recording_consent_plan (Hash)
    #     * :metadata (Hash{String => Object})
    #     * :background_speech_denoising_plan (Hash)
    #       * :smart_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #       * :fourier_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #         * :media_detection_enabled (Boolean)
    #         * :static_threshold (Float)
    #         * :baseline_offset_db (Float)
    #         * :window_size_ms (Float)
    #         * :baseline_percentile (Float)
    #     * :analysis_plan (Hash)
    #       * :min_messages_threshold (Float)
    #       * :summary_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :structured_data_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :schema (Hash)
    #           * :type (Vapi::JsonSchemaType)
    #           * :items (Hash{String => Object})
    #           * :properties (Hash{String => Object})
    #           * :description (String)
    #           * :pattern (String)
    #           * :format (Vapi::JsonSchemaFormat)
    #           * :required (Array<String>)
    #           * :enum (Array<String>)
    #           * :title (String)
    #         * :timeout_seconds (Float)
    #       * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #       * :success_evaluation_plan (Hash)
    #         * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :outcome_ids (Array<String>)
    #     * :artifact_plan (Hash)
    #       * :recording_enabled (Boolean)
    #       * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #       * :recording_use_custom_storage_enabled (Boolean)
    #       * :video_recording_enabled (Boolean)
    #       * :full_message_history_enabled (Boolean)
    #       * :pcap_enabled (Boolean)
    #       * :pcap_s_3_path_prefix (String)
    #       * :pcap_use_custom_storage_enabled (Boolean)
    #       * :logging_enabled (Boolean)
    #       * :logging_use_custom_storage_enabled (Boolean)
    #       * :transcript_plan (Hash)
    #         * :enabled (Boolean)
    #         * :assistant_name (String)
    #         * :user_name (String)
    #       * :recording_path (String)
    #       * :structured_output_ids (Array<String>)
    #       * :scorecard_ids (Array<String>)
    #       * :scorecards (Array<Vapi::CreateScorecardDto>)
    #       * :logging_path (String)
    #     * :start_speaking_plan (Hash)
    #       * :wait_seconds (Float)
    #       * :smart_endpointing_enabled (Hash)
    #       * :smart_endpointing_plan (Hash)
    #       * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #       * :transcription_endpointing_plan (Hash)
    #         * :on_punctuation_seconds (Float)
    #         * :on_no_punctuation_seconds (Float)
    #         * :on_number_seconds (Float)
    #     * :stop_speaking_plan (Hash)
    #       * :num_words (Float)
    #       * :voice_seconds (Float)
    #       * :backoff_seconds (Float)
    #       * :acknowledgement_phrases (Array<String>)
    #       * :interruption_phrases (Array<String>)
    #     * :monitor_plan (Hash)
    #       * :listen_enabled (Boolean)
    #       * :listen_authentication_enabled (Boolean)
    #       * :control_enabled (Boolean)
    #       * :control_authentication_enabled (Boolean)
    #     * :credential_ids (Array<String>)
    #     * :server (Hash)
    #       * :timeout_seconds (Float)
    #       * :credential_id (String)
    #       * :static_ip_addresses_enabled (Boolean)
    #       * :url (String)
    #       * :headers (Hash{String => Object})
    #       * :backoff_plan (Hash)
    #         * :type (Hash{String => Object})
    #         * :max_retries (Float)
    #         * :base_delay_seconds (Float)
    #         * :excluded_status_codes (Array<Hash{String => Object}>)
    #     * :keypad_input_plan (Hash)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #       * :delimiters (Vapi::KeypadInputPlanDelimiters)
    # @param messages [Array<Hash>] This is an array of chat messages in the session.Request of type Array<Vapi::Sessions::CreateSessionDtoMessagesItem>, as a Hash
    # @param customer [Hash] This is the customer information associated with this session.Request of type Vapi::CreateCustomerDto, as a Hash
    #   * :number_e_164_check_enabled (Boolean)
    #   * :extension (String)
    #   * :assistant_overrides (Hash)
    #     * :transcriber (Hash)
    #     * :model (Hash)
    #     * :voice (Hash)
    #     * :first_message (String)
    #     * :first_message_interruptions_enabled (Boolean)
    #     * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #     * :voicemail_detection (Hash)
    #     * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #     * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #     * :max_duration_seconds (Float)
    #     * :background_sound (Hash)
    #     * :model_output_in_messages_enabled (Boolean)
    #     * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #     * :observability_plan (Hash)
    #       * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #       * :tags (Array<String>)
    #       * :metadata (Hash{String => Object})
    #     * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #     * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #     * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #     * :variable_values (Hash{String => Object})
    #     * :name (String)
    #     * :voicemail_message (String)
    #     * :end_call_message (String)
    #     * :end_call_phrases (Array<String>)
    #     * :compliance_plan (Hash)
    #       * :hipaa_enabled (Boolean)
    #       * :pci_enabled (Boolean)
    #       * :security_filter_plan (Hash)
    #         * :enabled (Boolean)
    #         * :filters (Array<Vapi::SecurityFilterBase>)
    #         * :mode (Vapi::SecurityFilterPlanMode)
    #         * :replacement_text (String)
    #       * :recording_consent_plan (Hash)
    #     * :metadata (Hash{String => Object})
    #     * :background_speech_denoising_plan (Hash)
    #       * :smart_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #       * :fourier_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #         * :media_detection_enabled (Boolean)
    #         * :static_threshold (Float)
    #         * :baseline_offset_db (Float)
    #         * :window_size_ms (Float)
    #         * :baseline_percentile (Float)
    #     * :analysis_plan (Hash)
    #       * :min_messages_threshold (Float)
    #       * :summary_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :structured_data_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :schema (Hash)
    #           * :type (Vapi::JsonSchemaType)
    #           * :items (Hash{String => Object})
    #           * :properties (Hash{String => Object})
    #           * :description (String)
    #           * :pattern (String)
    #           * :format (Vapi::JsonSchemaFormat)
    #           * :required (Array<String>)
    #           * :enum (Array<String>)
    #           * :title (String)
    #         * :timeout_seconds (Float)
    #       * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #       * :success_evaluation_plan (Hash)
    #         * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :outcome_ids (Array<String>)
    #     * :artifact_plan (Hash)
    #       * :recording_enabled (Boolean)
    #       * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #       * :recording_use_custom_storage_enabled (Boolean)
    #       * :video_recording_enabled (Boolean)
    #       * :full_message_history_enabled (Boolean)
    #       * :pcap_enabled (Boolean)
    #       * :pcap_s_3_path_prefix (String)
    #       * :pcap_use_custom_storage_enabled (Boolean)
    #       * :logging_enabled (Boolean)
    #       * :logging_use_custom_storage_enabled (Boolean)
    #       * :transcript_plan (Hash)
    #         * :enabled (Boolean)
    #         * :assistant_name (String)
    #         * :user_name (String)
    #       * :recording_path (String)
    #       * :structured_output_ids (Array<String>)
    #       * :scorecard_ids (Array<String>)
    #       * :scorecards (Array<Vapi::CreateScorecardDto>)
    #       * :logging_path (String)
    #     * :start_speaking_plan (Hash)
    #       * :wait_seconds (Float)
    #       * :smart_endpointing_enabled (Hash)
    #       * :smart_endpointing_plan (Hash)
    #       * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #       * :transcription_endpointing_plan (Hash)
    #         * :on_punctuation_seconds (Float)
    #         * :on_no_punctuation_seconds (Float)
    #         * :on_number_seconds (Float)
    #     * :stop_speaking_plan (Hash)
    #       * :num_words (Float)
    #       * :voice_seconds (Float)
    #       * :backoff_seconds (Float)
    #       * :acknowledgement_phrases (Array<String>)
    #       * :interruption_phrases (Array<String>)
    #     * :monitor_plan (Hash)
    #       * :listen_enabled (Boolean)
    #       * :listen_authentication_enabled (Boolean)
    #       * :control_enabled (Boolean)
    #       * :control_authentication_enabled (Boolean)
    #     * :credential_ids (Array<String>)
    #     * :server (Hash)
    #       * :timeout_seconds (Float)
    #       * :credential_id (String)
    #       * :static_ip_addresses_enabled (Boolean)
    #       * :url (String)
    #       * :headers (Hash{String => Object})
    #       * :backoff_plan (Hash)
    #         * :type (Hash{String => Object})
    #         * :max_retries (Float)
    #         * :base_delay_seconds (Float)
    #         * :excluded_status_codes (Array<Hash{String => Object}>)
    #     * :keypad_input_plan (Hash)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #       * :delimiters (Vapi::KeypadInputPlanDelimiters)
    #   * :number (String)
    #   * :sip_uri (String)
    #   * :name (String)
    #   * :email (String)
    #   * :external_id (String)
    # @param phone_number_id [String] This is the ID of the phone number associated with this session.
    # @param phone_number [Hash] This is the phone number configuration for this session.Request of type Vapi::ImportTwilioPhoneNumberDto, as a Hash
    #   * :fallback_destination (Hash)
    #   * :hooks (Array<Vapi::ImportTwilioPhoneNumberDtoHooksItem>)
    #   * :sms_enabled (Boolean)
    #   * :twilio_phone_number (String)
    #   * :twilio_account_sid (String)
    #   * :twilio_auth_token (String)
    #   * :twilio_api_key (String)
    #   * :twilio_api_secret (String)
    #   * :name (String)
    #   * :assistant_id (String)
    #   * :workflow_id (String)
    #   * :squad_id (String)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :credential_id (String)
    #     * :static_ip_addresses_enabled (Boolean)
    #     * :url (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object})
    #       * :max_retries (Float)
    #       * :base_delay_seconds (Float)
    #       * :excluded_status_codes (Array<Hash{String => Object}>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
    def create(name: nil, status: nil, expiration_seconds: nil, assistant_id: nil, assistant: nil, squad_id: nil,
               squad: nil, messages: nil, customer: nil, phone_number_id: nil, phone_number: nil, request_options: nil)
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
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          status: status,
          expirationSeconds: expiration_seconds,
          assistantId: assistant_id,
          assistant: assistant,
          squadId: squad_id,
          squad: squad,
          messages: messages,
          customer: customer,
          phoneNumberId: phone_number_id,
          phoneNumber: phone_number
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/session"
      end
      Vapi::Session.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
      end
      Vapi::Session.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
      end
      Vapi::Session.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param name [String] This is the new name for the session. Maximum length is 40 characters.
    # @param status [Vapi::Sessions::UpdateSessionDtoStatus] This is the new status for the session.
    # @param expiration_seconds [Float] Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not
    #  set.
    # @param messages [Array<Hash>] This is the updated array of chat messages.Request of type Array<Vapi::Sessions::UpdateSessionDtoMessagesItem>, as a Hash
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
    def update(id:, name: nil, status: nil, expiration_seconds: nil, messages: nil, request_options: nil)
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
          name: name,
          status: status,
          expirationSeconds: expiration_seconds,
          messages: messages
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
      end
      Vapi::Session.from_json(json_object: response.body)
    end
  end

  class AsyncSessionsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncSessionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param name [String] This is the name of the customer. This is just for your own reference.
    #  For SIP inbound calls, this is extracted from the `From` SIP header with format
    #  `"Display Name" <sip:username@domain>`.
    # @param assistant_id [String] This is the ID of the assistant to filter sessions by.
    # @param squad_id [String] This is the ID of the squad to filter sessions by.
    # @param workflow_id [String] This is the ID of the workflow to filter sessions by.
    # @param number_e_164_check_enabled [Boolean] This is the flag to toggle the E164 check for the `number` field. This is an
    #  advanced property which should be used if you know your use case requires it.
    #  Use cases:
    #  - `false`: To allow non-E164 numbers like `+001234567890`, `1234`, or `abc`.
    #  This is useful for dialing out to non-E164 numbers on your SIP trunks.
    #  - `true` (default): To allow only E164 numbers like `+14155551234`. This is
    #  standard for PSTN calls.
    #  If `false`, the `number` is still required to only contain alphanumeric
    #  characters (regex: `/^\+?[a-zA-Z0-9]+$/`).
    #  @default true (E164 check is enabled)
    # @param extension [String] This is the extension that will be dialed after the call is answered.
    # @param assistant_overrides [String] These are the overrides for the assistant's settings and template variables
    #  specific to this customer.
    #  This allows customization of the assistant's behavior for individual customers
    #  in batch calls.
    # @param number [String] This is the number of the customer.
    # @param sip_uri [String] This is the SIP URI of the customer.
    # @param email [String] This is the email of the customer.
    # @param external_id [String] This is the external ID of the customer.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Sessions::ListSessionsRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::SessionPaginatedResponse]
    def list(name: nil, assistant_id: nil, squad_id: nil, workflow_id: nil, number_e_164_check_enabled: nil,
             extension: nil, assistant_overrides: nil, number: nil, sip_uri: nil, email: nil, external_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
            "name": name,
            "assistantId": assistant_id,
            "squadId": squad_id,
            "workflowId": workflow_id,
            "numberE164CheckEnabled": number_e_164_check_enabled,
            "extension": extension,
            "assistantOverrides": assistant_overrides,
            "number": number,
            "sipUri": sip_uri,
            "email": email,
            "externalId": external_id,
            "page": page,
            "sortOrder": sort_order,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/session"
        end
        Vapi::SessionPaginatedResponse.from_json(json_object: response.body)
      end
    end

    # @param name [String] This is a user-defined name for the session. Maximum length is 40 characters.
    # @param status [Vapi::Sessions::CreateSessionDtoStatus] This is the current status of the session. Can be either 'active' or
    #  'completed'.
    # @param expiration_seconds [Float] Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not
    #  set.
    # @param assistant_id [String] This is the ID of the assistant associated with this session. Use this when
    #  referencing an existing assistant.
    # @param assistant [Hash] This is the assistant configuration for this session. Use this when creating a
    #  new assistant configuration.
    #  If assistantId is provided, this will be ignored.Request of type Vapi::CreateAssistantDto, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::CreateAssistantDtoFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::CreateAssistantDtoClientMessagesItem>)
    #   * :server_messages (Array<Vapi::CreateAssistantDtoServerMessagesItem>)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Hash)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :credentials (Array<Vapi::CreateAssistantDtoCredentialsItem>)
    #   * :hooks (Array<Vapi::CreateAssistantDtoHooksItem>)
    #   * :name (String)
    #   * :voicemail_message (String)
    #   * :end_call_message (String)
    #   * :end_call_phrases (Array<String>)
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
    #     * :security_filter_plan (Hash)
    #       * :enabled (Boolean)
    #       * :filters (Array<Vapi::SecurityFilterBase>)
    #       * :mode (Vapi::SecurityFilterPlanMode)
    #       * :replacement_text (String)
    #     * :recording_consent_plan (Hash)
    #   * :metadata (Hash{String => Object})
    #   * :background_speech_denoising_plan (Hash)
    #     * :smart_denoising_plan (Hash)
    #       * :enabled (Boolean)
    #     * :fourier_denoising_plan (Hash)
    #       * :enabled (Boolean)
    #       * :media_detection_enabled (Boolean)
    #       * :static_threshold (Float)
    #       * :baseline_offset_db (Float)
    #       * :window_size_ms (Float)
    #       * :baseline_percentile (Float)
    #   * :analysis_plan (Hash)
    #     * :min_messages_threshold (Float)
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
    #         * :pattern (String)
    #         * :format (Vapi::JsonSchemaFormat)
    #         * :required (Array<String>)
    #         * :enum (Array<String>)
    #         * :title (String)
    #       * :timeout_seconds (Float)
    #     * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #     * :success_evaluation_plan (Hash)
    #       * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #       * :messages (Array<Hash{String => Object}>)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #     * :outcome_ids (Array<String>)
    #   * :artifact_plan (Hash)
    #     * :recording_enabled (Boolean)
    #     * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #     * :recording_use_custom_storage_enabled (Boolean)
    #     * :video_recording_enabled (Boolean)
    #     * :full_message_history_enabled (Boolean)
    #     * :pcap_enabled (Boolean)
    #     * :pcap_s_3_path_prefix (String)
    #     * :pcap_use_custom_storage_enabled (Boolean)
    #     * :logging_enabled (Boolean)
    #     * :logging_use_custom_storage_enabled (Boolean)
    #     * :transcript_plan (Hash)
    #       * :enabled (Boolean)
    #       * :assistant_name (String)
    #       * :user_name (String)
    #     * :recording_path (String)
    #     * :structured_output_ids (Array<String>)
    #     * :scorecard_ids (Array<String>)
    #     * :scorecards (Array<Vapi::CreateScorecardDto>)
    #     * :logging_path (String)
    #   * :start_speaking_plan (Hash)
    #     * :wait_seconds (Float)
    #     * :smart_endpointing_enabled (Hash)
    #     * :smart_endpointing_plan (Hash)
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
    #     * :listen_authentication_enabled (Boolean)
    #     * :control_enabled (Boolean)
    #     * :control_authentication_enabled (Boolean)
    #   * :credential_ids (Array<String>)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :credential_id (String)
    #     * :static_ip_addresses_enabled (Boolean)
    #     * :url (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object})
    #       * :max_retries (Float)
    #       * :base_delay_seconds (Float)
    #       * :excluded_status_codes (Array<Hash{String => Object}>)
    #   * :keypad_input_plan (Hash)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    #     * :delimiters (Vapi::KeypadInputPlanDelimiters)
    # @param squad_id [String] This is the squad ID associated with this session. Use this when referencing an
    #  existing squad.
    # @param squad [Hash] This is the squad configuration for this session. Use this when creating a new
    #  squad configuration.
    #  If squadId is provided, this will be ignored.Request of type Vapi::CreateSquadDto, as a Hash
    #   * :name (String)
    #   * :members (Array<Vapi::SquadMemberDto>)
    #   * :members_overrides (Hash)
    #     * :transcriber (Hash)
    #     * :model (Hash)
    #     * :voice (Hash)
    #     * :first_message (String)
    #     * :first_message_interruptions_enabled (Boolean)
    #     * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #     * :voicemail_detection (Hash)
    #     * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #     * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #     * :max_duration_seconds (Float)
    #     * :background_sound (Hash)
    #     * :model_output_in_messages_enabled (Boolean)
    #     * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #     * :observability_plan (Hash)
    #       * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #       * :tags (Array<String>)
    #       * :metadata (Hash{String => Object})
    #     * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #     * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #     * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #     * :variable_values (Hash{String => Object})
    #     * :name (String)
    #     * :voicemail_message (String)
    #     * :end_call_message (String)
    #     * :end_call_phrases (Array<String>)
    #     * :compliance_plan (Hash)
    #       * :hipaa_enabled (Boolean)
    #       * :pci_enabled (Boolean)
    #       * :security_filter_plan (Hash)
    #         * :enabled (Boolean)
    #         * :filters (Array<Vapi::SecurityFilterBase>)
    #         * :mode (Vapi::SecurityFilterPlanMode)
    #         * :replacement_text (String)
    #       * :recording_consent_plan (Hash)
    #     * :metadata (Hash{String => Object})
    #     * :background_speech_denoising_plan (Hash)
    #       * :smart_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #       * :fourier_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #         * :media_detection_enabled (Boolean)
    #         * :static_threshold (Float)
    #         * :baseline_offset_db (Float)
    #         * :window_size_ms (Float)
    #         * :baseline_percentile (Float)
    #     * :analysis_plan (Hash)
    #       * :min_messages_threshold (Float)
    #       * :summary_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :structured_data_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :schema (Hash)
    #           * :type (Vapi::JsonSchemaType)
    #           * :items (Hash{String => Object})
    #           * :properties (Hash{String => Object})
    #           * :description (String)
    #           * :pattern (String)
    #           * :format (Vapi::JsonSchemaFormat)
    #           * :required (Array<String>)
    #           * :enum (Array<String>)
    #           * :title (String)
    #         * :timeout_seconds (Float)
    #       * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #       * :success_evaluation_plan (Hash)
    #         * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :outcome_ids (Array<String>)
    #     * :artifact_plan (Hash)
    #       * :recording_enabled (Boolean)
    #       * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #       * :recording_use_custom_storage_enabled (Boolean)
    #       * :video_recording_enabled (Boolean)
    #       * :full_message_history_enabled (Boolean)
    #       * :pcap_enabled (Boolean)
    #       * :pcap_s_3_path_prefix (String)
    #       * :pcap_use_custom_storage_enabled (Boolean)
    #       * :logging_enabled (Boolean)
    #       * :logging_use_custom_storage_enabled (Boolean)
    #       * :transcript_plan (Hash)
    #         * :enabled (Boolean)
    #         * :assistant_name (String)
    #         * :user_name (String)
    #       * :recording_path (String)
    #       * :structured_output_ids (Array<String>)
    #       * :scorecard_ids (Array<String>)
    #       * :scorecards (Array<Vapi::CreateScorecardDto>)
    #       * :logging_path (String)
    #     * :start_speaking_plan (Hash)
    #       * :wait_seconds (Float)
    #       * :smart_endpointing_enabled (Hash)
    #       * :smart_endpointing_plan (Hash)
    #       * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #       * :transcription_endpointing_plan (Hash)
    #         * :on_punctuation_seconds (Float)
    #         * :on_no_punctuation_seconds (Float)
    #         * :on_number_seconds (Float)
    #     * :stop_speaking_plan (Hash)
    #       * :num_words (Float)
    #       * :voice_seconds (Float)
    #       * :backoff_seconds (Float)
    #       * :acknowledgement_phrases (Array<String>)
    #       * :interruption_phrases (Array<String>)
    #     * :monitor_plan (Hash)
    #       * :listen_enabled (Boolean)
    #       * :listen_authentication_enabled (Boolean)
    #       * :control_enabled (Boolean)
    #       * :control_authentication_enabled (Boolean)
    #     * :credential_ids (Array<String>)
    #     * :server (Hash)
    #       * :timeout_seconds (Float)
    #       * :credential_id (String)
    #       * :static_ip_addresses_enabled (Boolean)
    #       * :url (String)
    #       * :headers (Hash{String => Object})
    #       * :backoff_plan (Hash)
    #         * :type (Hash{String => Object})
    #         * :max_retries (Float)
    #         * :base_delay_seconds (Float)
    #         * :excluded_status_codes (Array<Hash{String => Object}>)
    #     * :keypad_input_plan (Hash)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #       * :delimiters (Vapi::KeypadInputPlanDelimiters)
    # @param messages [Array<Hash>] This is an array of chat messages in the session.Request of type Array<Vapi::Sessions::CreateSessionDtoMessagesItem>, as a Hash
    # @param customer [Hash] This is the customer information associated with this session.Request of type Vapi::CreateCustomerDto, as a Hash
    #   * :number_e_164_check_enabled (Boolean)
    #   * :extension (String)
    #   * :assistant_overrides (Hash)
    #     * :transcriber (Hash)
    #     * :model (Hash)
    #     * :voice (Hash)
    #     * :first_message (String)
    #     * :first_message_interruptions_enabled (Boolean)
    #     * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #     * :voicemail_detection (Hash)
    #     * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #     * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #     * :max_duration_seconds (Float)
    #     * :background_sound (Hash)
    #     * :model_output_in_messages_enabled (Boolean)
    #     * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #     * :observability_plan (Hash)
    #       * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #       * :tags (Array<String>)
    #       * :metadata (Hash{String => Object})
    #     * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #     * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #     * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #     * :variable_values (Hash{String => Object})
    #     * :name (String)
    #     * :voicemail_message (String)
    #     * :end_call_message (String)
    #     * :end_call_phrases (Array<String>)
    #     * :compliance_plan (Hash)
    #       * :hipaa_enabled (Boolean)
    #       * :pci_enabled (Boolean)
    #       * :security_filter_plan (Hash)
    #         * :enabled (Boolean)
    #         * :filters (Array<Vapi::SecurityFilterBase>)
    #         * :mode (Vapi::SecurityFilterPlanMode)
    #         * :replacement_text (String)
    #       * :recording_consent_plan (Hash)
    #     * :metadata (Hash{String => Object})
    #     * :background_speech_denoising_plan (Hash)
    #       * :smart_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #       * :fourier_denoising_plan (Hash)
    #         * :enabled (Boolean)
    #         * :media_detection_enabled (Boolean)
    #         * :static_threshold (Float)
    #         * :baseline_offset_db (Float)
    #         * :window_size_ms (Float)
    #         * :baseline_percentile (Float)
    #     * :analysis_plan (Hash)
    #       * :min_messages_threshold (Float)
    #       * :summary_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :structured_data_plan (Hash)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :schema (Hash)
    #           * :type (Vapi::JsonSchemaType)
    #           * :items (Hash{String => Object})
    #           * :properties (Hash{String => Object})
    #           * :description (String)
    #           * :pattern (String)
    #           * :format (Vapi::JsonSchemaFormat)
    #           * :required (Array<String>)
    #           * :enum (Array<String>)
    #           * :title (String)
    #         * :timeout_seconds (Float)
    #       * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #       * :success_evaluation_plan (Hash)
    #         * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #         * :messages (Array<Hash{String => Object}>)
    #         * :enabled (Boolean)
    #         * :timeout_seconds (Float)
    #       * :outcome_ids (Array<String>)
    #     * :artifact_plan (Hash)
    #       * :recording_enabled (Boolean)
    #       * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #       * :recording_use_custom_storage_enabled (Boolean)
    #       * :video_recording_enabled (Boolean)
    #       * :full_message_history_enabled (Boolean)
    #       * :pcap_enabled (Boolean)
    #       * :pcap_s_3_path_prefix (String)
    #       * :pcap_use_custom_storage_enabled (Boolean)
    #       * :logging_enabled (Boolean)
    #       * :logging_use_custom_storage_enabled (Boolean)
    #       * :transcript_plan (Hash)
    #         * :enabled (Boolean)
    #         * :assistant_name (String)
    #         * :user_name (String)
    #       * :recording_path (String)
    #       * :structured_output_ids (Array<String>)
    #       * :scorecard_ids (Array<String>)
    #       * :scorecards (Array<Vapi::CreateScorecardDto>)
    #       * :logging_path (String)
    #     * :start_speaking_plan (Hash)
    #       * :wait_seconds (Float)
    #       * :smart_endpointing_enabled (Hash)
    #       * :smart_endpointing_plan (Hash)
    #       * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #       * :transcription_endpointing_plan (Hash)
    #         * :on_punctuation_seconds (Float)
    #         * :on_no_punctuation_seconds (Float)
    #         * :on_number_seconds (Float)
    #     * :stop_speaking_plan (Hash)
    #       * :num_words (Float)
    #       * :voice_seconds (Float)
    #       * :backoff_seconds (Float)
    #       * :acknowledgement_phrases (Array<String>)
    #       * :interruption_phrases (Array<String>)
    #     * :monitor_plan (Hash)
    #       * :listen_enabled (Boolean)
    #       * :listen_authentication_enabled (Boolean)
    #       * :control_enabled (Boolean)
    #       * :control_authentication_enabled (Boolean)
    #     * :credential_ids (Array<String>)
    #     * :server (Hash)
    #       * :timeout_seconds (Float)
    #       * :credential_id (String)
    #       * :static_ip_addresses_enabled (Boolean)
    #       * :url (String)
    #       * :headers (Hash{String => Object})
    #       * :backoff_plan (Hash)
    #         * :type (Hash{String => Object})
    #         * :max_retries (Float)
    #         * :base_delay_seconds (Float)
    #         * :excluded_status_codes (Array<Hash{String => Object}>)
    #     * :keypad_input_plan (Hash)
    #       * :enabled (Boolean)
    #       * :timeout_seconds (Float)
    #       * :delimiters (Vapi::KeypadInputPlanDelimiters)
    #   * :number (String)
    #   * :sip_uri (String)
    #   * :name (String)
    #   * :email (String)
    #   * :external_id (String)
    # @param phone_number_id [String] This is the ID of the phone number associated with this session.
    # @param phone_number [Hash] This is the phone number configuration for this session.Request of type Vapi::ImportTwilioPhoneNumberDto, as a Hash
    #   * :fallback_destination (Hash)
    #   * :hooks (Array<Vapi::ImportTwilioPhoneNumberDtoHooksItem>)
    #   * :sms_enabled (Boolean)
    #   * :twilio_phone_number (String)
    #   * :twilio_account_sid (String)
    #   * :twilio_auth_token (String)
    #   * :twilio_api_key (String)
    #   * :twilio_api_secret (String)
    #   * :name (String)
    #   * :assistant_id (String)
    #   * :workflow_id (String)
    #   * :squad_id (String)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :credential_id (String)
    #     * :static_ip_addresses_enabled (Boolean)
    #     * :url (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object})
    #       * :max_retries (Float)
    #       * :base_delay_seconds (Float)
    #       * :excluded_status_codes (Array<Hash{String => Object}>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
    def create(name: nil, status: nil, expiration_seconds: nil, assistant_id: nil, assistant: nil, squad_id: nil,
               squad: nil, messages: nil, customer: nil, phone_number_id: nil, phone_number: nil, request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            status: status,
            expirationSeconds: expiration_seconds,
            assistantId: assistant_id,
            assistant: assistant,
            squadId: squad_id,
            squad: squad,
            messages: messages,
            customer: customer,
            phoneNumberId: phone_number_id,
            phoneNumber: phone_number
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/session"
        end
        Vapi::Session.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
        end
        Vapi::Session.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
        end
        Vapi::Session.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param name [String] This is the new name for the session. Maximum length is 40 characters.
    # @param status [Vapi::Sessions::UpdateSessionDtoStatus] This is the new status for the session.
    # @param expiration_seconds [Float] Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not
    #  set.
    # @param messages [Array<Hash>] This is the updated array of chat messages.Request of type Array<Vapi::Sessions::UpdateSessionDtoMessagesItem>, as a Hash
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Session]
    def update(id:, name: nil, status: nil, expiration_seconds: nil, messages: nil, request_options: nil)
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
            name: name,
            status: status,
            expirationSeconds: expiration_seconds,
            messages: messages
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
        end
        Vapi::Session.from_json(json_object: response.body)
      end
    end
  end
end
