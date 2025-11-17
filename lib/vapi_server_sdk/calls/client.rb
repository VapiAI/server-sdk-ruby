# frozen_string_literal: true

require_relative "../../requests"
require "date"
require_relative "../types/call"
require "json"
require_relative "../types/create_customer_dto"
require_relative "../types/schedule_plan"
require_relative "../types/create_assistant_dto"
require_relative "../types/assistant_overrides"
require_relative "../types/create_squad_dto"
require_relative "../types/create_workflow_dto"
require_relative "../types/workflow_overrides"
require_relative "../types/import_twilio_phone_number_dto"
require_relative "types/create_calls_response"
require_relative "types/call_controller_find_all_paginated_request_sort_order"
require_relative "../types/call_paginated_response"
require "async"

module Vapi
  class CallsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::CallsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String] This is the unique identifier for the call.
    # @param assistant_id [String] This will return calls with the specified assistantId.
    # @param phone_number_id [String] This is the phone number that will be used for the call. To use a transient
    #  number, use `phoneNumber` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
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
    # @return [Array<Vapi::Call>]
    def list(id: nil, assistant_id: nil, phone_number_id: nil, limit: nil, created_at_gt: nil, created_at_lt: nil,
             created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          "id": id,
          "assistantId": assistant_id,
          "phoneNumberId": phone_number_id,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/call"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Vapi::Call.from_json(json_object: item)
      end
    end

    # @param customers [Array<Hash>] This is used to issue batch calls to multiple customers.
    #  Only relevant for `outboundPhoneCall`. To call a single customer, use `customer`
    #  instead.Request of type Array<Vapi::CreateCustomerDto>, as a Hash
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
    # @param name [String] This is the name of the call. This is just for your own reference.
    # @param schedule_plan [Hash] This is the schedule plan of the call.Request of type Vapi::SchedulePlan, as a Hash
    #   * :earliest_at (DateTime)
    #   * :latest_at (DateTime)
    # @param transport [Hash{String => Object}] This is the transport of the call.
    # @param assistant_id [String] This is the assistant ID that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    #  To start a call with:
    #  - Assistant, use `assistantId` or `assistant`
    #  - Squad, use `squadId` or `squad`
    #  - Workflow, use `workflowId` or `workflow`
    # @param assistant [Hash] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant`
    #  - Squad, use `squad`
    #  - Workflow, use `workflow`Request of type Vapi::CreateAssistantDto, as a Hash
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
    # @param assistant_overrides [Hash] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Hash)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param squad_id [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param squad [Hash] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`Request of type Vapi::CreateSquadDto, as a Hash
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
    # @param squad_overrides [Hash] These are the overrides for the `squad` or `squadId`'s member settings and
    #  template variables.
    #  This will apply to all members of the squad.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Hash)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param workflow_id [String] This is the workflow that will be used for the call. To use a transient
    #  workflow, use `workflow` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param workflow [Hash] This is a workflow that will be used for the call. To use an existing workflow,
    #  use `workflowId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`Request of type Vapi::CreateWorkflowDto, as a Hash
    #   * :nodes (Array<Vapi::CreateWorkflowDtoNodesItem>)
    #   * :model (Hash)
    #   * :transcriber (Hash)
    #   * :voice (Hash)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :background_sound (Hash)
    #   * :hooks (Array<Vapi::CreateWorkflowDtoHooksItem>)
    #   * :credentials (Array<Vapi::CreateWorkflowDtoCredentialsItem>)
    #   * :voicemail_detection (Hash)
    #   * :max_duration_seconds (Float)
    #   * :name (String)
    #   * :edges (Array<Vapi::Edge>)
    #   * :global_prompt (String)
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
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
    #     * :security_filter_plan (Hash)
    #       * :enabled (Boolean)
    #       * :filters (Array<Vapi::SecurityFilterBase>)
    #       * :mode (Vapi::SecurityFilterPlanMode)
    #       * :replacement_text (String)
    #     * :recording_consent_plan (Hash)
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
    #   * :credential_ids (Array<String>)
    #   * :keypad_input_plan (Hash)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    #     * :delimiters (Vapi::KeypadInputPlanDelimiters)
    #   * :voicemail_message (String)
    # @param workflow_overrides [Hash] These are the overrides for the `workflow` or `workflowId`'s settings and
    #  template variables.Request of type Vapi::WorkflowOverrides, as a Hash
    #   * :variable_values (Hash{String => Object})
    # @param phone_number_id [String] This is the phone number that will be used for the call. To use a transient
    #  number, use `phoneNumber` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param phone_number [Hash] This is the phone number that will be used for the call. To use an existing
    #  number, use `phoneNumberId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.Request of type Vapi::ImportTwilioPhoneNumberDto, as a Hash
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
    # @param customer_id [String] This is the customer that will be called. To call a transient customer , use
    #  `customer` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param customer [Hash] This is the customer that will be called. To call an existing customer, use
    #  `customerId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.Request of type Vapi::CreateCustomerDto, as a Hash
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call, Vapi::CallBatchResponse]
    def create(customers: nil, name: nil, schedule_plan: nil, transport: nil, assistant_id: nil, assistant: nil,
               assistant_overrides: nil, squad_id: nil, squad: nil, squad_overrides: nil, workflow_id: nil, workflow: nil, workflow_overrides: nil, phone_number_id: nil, phone_number: nil, customer_id: nil, customer: nil, request_options: nil)
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
          customers: customers,
          name: name,
          schedulePlan: schedule_plan,
          transport: transport,
          assistantId: assistant_id,
          assistant: assistant,
          assistantOverrides: assistant_overrides,
          squadId: squad_id,
          squad: squad,
          squadOverrides: squad_overrides,
          workflowId: workflow_id,
          workflow: workflow,
          workflowOverrides: workflow_overrides,
          phoneNumberId: phone_number_id,
          phoneNumber: phone_number,
          customerId: customer_id,
          customer: customer
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/call"
      end
      Vapi::Calls::CreateCallsResponse.from_json(json_object: response.body)
    end

    # @param assistant_overrides [Hash{String => Object}] Filter by assistant overrides. Use variableValues to filter by template
    #  variables.
    # @param customer [Hash{String => Object}] Filter by customer properties. Supports filtering by number, name, externalId,
    #  and extension.
    # @param assistant_id [String] This will return calls with the specified assistantId.
    # @param assistant_name [String] This will return calls where the transient assistant name exactly matches the
    #  specified value (case-insensitive).
    # @param squad_id [String] This will return calls with the specified squadId.
    # @param squad_name [String] This will return calls where the transient squad name exactly matches the
    #  specified value (case-insensitive).
    # @param id [String] This will return calls with the specified callId.
    # @param id_any [String] This will return calls with the specified callIds.
    # @param cost_le [Float] This will return calls where the cost is less than or equal to the specified
    #  value.
    # @param cost_ge [Float] This will return calls where the cost is greater than or equal to the specified
    #  value.
    # @param cost [Float] This will return calls with the exact specified cost.
    # @param success_evaluation [String] This will return calls with the specified successEvaluation.
    # @param ended_reason [String] This will return calls with the specified endedReason.
    # @param phone_number_id [String] This will return calls with the specified phoneNumberId.
    # @param structured_outputs [Hash{String => Vapi::StructuredOutputFilterDto}] Filter calls by structured output values. Use structured output ID as key and
    #  filter operators as values.
    # @param score [String] Filter calls by the first scorecard's normalized score.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Calls::CallControllerFindAllPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::CallPaginatedResponse]
    def call_controller_find_all_paginated(assistant_overrides: nil, customer: nil, assistant_id: nil,
                                           assistant_name: nil, squad_id: nil, squad_name: nil, id: nil, id_any: nil, cost_le: nil, cost_ge: nil, cost: nil, success_evaluation: nil, ended_reason: nil, phone_number_id: nil, structured_outputs: nil, score: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          "assistantOverrides": assistant_overrides,
          "customer": customer,
          "assistantId": assistant_id,
          "assistantName": assistant_name,
          "squadId": squad_id,
          "squadName": squad_name,
          "id": id,
          "idAny": id_any,
          "costLe": cost_le,
          "costGe": cost_ge,
          "cost": cost,
          "successEvaluation": success_evaluation,
          "endedReason": ended_reason,
          "phoneNumberId": phone_number_id,
          "structuredOutputs": structured_outputs,
          "score": score,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/v2/call"
      end
      Vapi::CallPaginatedResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/call/#{id}"
      end
      Vapi::Call.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param ids [Array<String>] These are the Call IDs to be bulk deleted.
    #  If provided, the call ID if any in the request query will be ignored
    #  When requesting a bulk delete, updates when a call is deleted will be sent as a
    #  webhook to the server URL configured in the Org settings.
    #  It may take up to a few hours to complete the bulk delete, and will be
    #  asynchronous.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call]
    def delete(id:, ids: nil, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), ids: ids }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/call/#{id}"
      end
      Vapi::Call.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param name [String] This is the name of the call. This is just for your own reference.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call]
    def update(id:, name: nil, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/call/#{id}"
      end
      Vapi::Call.from_json(json_object: response.body)
    end
  end

  class AsyncCallsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncCallsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String] This is the unique identifier for the call.
    # @param assistant_id [String] This will return calls with the specified assistantId.
    # @param phone_number_id [String] This is the phone number that will be used for the call. To use a transient
    #  number, use `phoneNumber` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
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
    # @return [Array<Vapi::Call>]
    def list(id: nil, assistant_id: nil, phone_number_id: nil, limit: nil, created_at_gt: nil, created_at_lt: nil,
             created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
            "id": id,
            "assistantId": assistant_id,
            "phoneNumberId": phone_number_id,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/call"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Vapi::Call.from_json(json_object: item)
        end
      end
    end

    # @param customers [Array<Hash>] This is used to issue batch calls to multiple customers.
    #  Only relevant for `outboundPhoneCall`. To call a single customer, use `customer`
    #  instead.Request of type Array<Vapi::CreateCustomerDto>, as a Hash
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
    # @param name [String] This is the name of the call. This is just for your own reference.
    # @param schedule_plan [Hash] This is the schedule plan of the call.Request of type Vapi::SchedulePlan, as a Hash
    #   * :earliest_at (DateTime)
    #   * :latest_at (DateTime)
    # @param transport [Hash{String => Object}] This is the transport of the call.
    # @param assistant_id [String] This is the assistant ID that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    #  To start a call with:
    #  - Assistant, use `assistantId` or `assistant`
    #  - Squad, use `squadId` or `squad`
    #  - Workflow, use `workflowId` or `workflow`
    # @param assistant [Hash] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant`
    #  - Squad, use `squad`
    #  - Workflow, use `workflow`Request of type Vapi::CreateAssistantDto, as a Hash
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
    # @param assistant_overrides [Hash] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Hash)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param squad_id [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param squad [Hash] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`Request of type Vapi::CreateSquadDto, as a Hash
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
    # @param squad_overrides [Hash] These are the overrides for the `squad` or `squadId`'s member settings and
    #  template variables.
    #  This will apply to all members of the squad.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
    #   * :max_duration_seconds (Float)
    #   * :background_sound (Hash)
    #   * :model_output_in_messages_enabled (Boolean)
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :tools_append (Array<Vapi::AssistantOverridesToolsAppendItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param workflow_id [String] This is the workflow that will be used for the call. To use a transient
    #  workflow, use `workflow` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param workflow [Hash] This is a workflow that will be used for the call. To use an existing workflow,
    #  use `workflowId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`Request of type Vapi::CreateWorkflowDto, as a Hash
    #   * :nodes (Array<Vapi::CreateWorkflowDtoNodesItem>)
    #   * :model (Hash)
    #   * :transcriber (Hash)
    #   * :voice (Hash)
    #   * :observability_plan (Hash)
    #     * :provider (Vapi::LangfuseObservabilityPlanProvider)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :background_sound (Hash)
    #   * :hooks (Array<Vapi::CreateWorkflowDtoHooksItem>)
    #   * :credentials (Array<Vapi::CreateWorkflowDtoCredentialsItem>)
    #   * :voicemail_detection (Hash)
    #   * :max_duration_seconds (Float)
    #   * :name (String)
    #   * :edges (Array<Vapi::Edge>)
    #   * :global_prompt (String)
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
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
    #     * :security_filter_plan (Hash)
    #       * :enabled (Boolean)
    #       * :filters (Array<Vapi::SecurityFilterBase>)
    #       * :mode (Vapi::SecurityFilterPlanMode)
    #       * :replacement_text (String)
    #     * :recording_consent_plan (Hash)
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
    #   * :credential_ids (Array<String>)
    #   * :keypad_input_plan (Hash)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    #     * :delimiters (Vapi::KeypadInputPlanDelimiters)
    #   * :voicemail_message (String)
    # @param workflow_overrides [Hash] These are the overrides for the `workflow` or `workflowId`'s settings and
    #  template variables.Request of type Vapi::WorkflowOverrides, as a Hash
    #   * :variable_values (Hash{String => Object})
    # @param phone_number_id [String] This is the phone number that will be used for the call. To use a transient
    #  number, use `phoneNumber` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param phone_number [Hash] This is the phone number that will be used for the call. To use an existing
    #  number, use `phoneNumberId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.Request of type Vapi::ImportTwilioPhoneNumberDto, as a Hash
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
    # @param customer_id [String] This is the customer that will be called. To call a transient customer , use
    #  `customer` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param customer [Hash] This is the customer that will be called. To call an existing customer, use
    #  `customerId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.Request of type Vapi::CreateCustomerDto, as a Hash
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call, Vapi::CallBatchResponse]
    def create(customers: nil, name: nil, schedule_plan: nil, transport: nil, assistant_id: nil, assistant: nil,
               assistant_overrides: nil, squad_id: nil, squad: nil, squad_overrides: nil, workflow_id: nil, workflow: nil, workflow_overrides: nil, phone_number_id: nil, phone_number: nil, customer_id: nil, customer: nil, request_options: nil)
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
            customers: customers,
            name: name,
            schedulePlan: schedule_plan,
            transport: transport,
            assistantId: assistant_id,
            assistant: assistant,
            assistantOverrides: assistant_overrides,
            squadId: squad_id,
            squad: squad,
            squadOverrides: squad_overrides,
            workflowId: workflow_id,
            workflow: workflow,
            workflowOverrides: workflow_overrides,
            phoneNumberId: phone_number_id,
            phoneNumber: phone_number,
            customerId: customer_id,
            customer: customer
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/call"
        end
        Vapi::Calls::CreateCallsResponse.from_json(json_object: response.body)
      end
    end

    # @param assistant_overrides [Hash{String => Object}] Filter by assistant overrides. Use variableValues to filter by template
    #  variables.
    # @param customer [Hash{String => Object}] Filter by customer properties. Supports filtering by number, name, externalId,
    #  and extension.
    # @param assistant_id [String] This will return calls with the specified assistantId.
    # @param assistant_name [String] This will return calls where the transient assistant name exactly matches the
    #  specified value (case-insensitive).
    # @param squad_id [String] This will return calls with the specified squadId.
    # @param squad_name [String] This will return calls where the transient squad name exactly matches the
    #  specified value (case-insensitive).
    # @param id [String] This will return calls with the specified callId.
    # @param id_any [String] This will return calls with the specified callIds.
    # @param cost_le [Float] This will return calls where the cost is less than or equal to the specified
    #  value.
    # @param cost_ge [Float] This will return calls where the cost is greater than or equal to the specified
    #  value.
    # @param cost [Float] This will return calls with the exact specified cost.
    # @param success_evaluation [String] This will return calls with the specified successEvaluation.
    # @param ended_reason [String] This will return calls with the specified endedReason.
    # @param phone_number_id [String] This will return calls with the specified phoneNumberId.
    # @param structured_outputs [Hash{String => Vapi::StructuredOutputFilterDto}] Filter calls by structured output values. Use structured output ID as key and
    #  filter operators as values.
    # @param score [String] Filter calls by the first scorecard's normalized score.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Calls::CallControllerFindAllPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::CallPaginatedResponse]
    def call_controller_find_all_paginated(assistant_overrides: nil, customer: nil, assistant_id: nil,
                                           assistant_name: nil, squad_id: nil, squad_name: nil, id: nil, id_any: nil, cost_le: nil, cost_ge: nil, cost: nil, success_evaluation: nil, ended_reason: nil, phone_number_id: nil, structured_outputs: nil, score: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
            "assistantOverrides": assistant_overrides,
            "customer": customer,
            "assistantId": assistant_id,
            "assistantName": assistant_name,
            "squadId": squad_id,
            "squadName": squad_name,
            "id": id,
            "idAny": id_any,
            "costLe": cost_le,
            "costGe": cost_ge,
            "cost": cost,
            "successEvaluation": success_evaluation,
            "endedReason": ended_reason,
            "phoneNumberId": phone_number_id,
            "structuredOutputs": structured_outputs,
            "score": score,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/v2/call"
        end
        Vapi::CallPaginatedResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/call/#{id}"
        end
        Vapi::Call.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param ids [Array<String>] These are the Call IDs to be bulk deleted.
    #  If provided, the call ID if any in the request query will be ignored
    #  When requesting a bulk delete, updates when a call is deleted will be sent as a
    #  webhook to the server URL configured in the Org settings.
    #  It may take up to a few hours to complete the bulk delete, and will be
    #  asynchronous.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call]
    def delete(id:, ids: nil, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), ids: ids }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/call/#{id}"
        end
        Vapi::Call.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param name [String] This is the name of the call. This is just for your own reference.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Call]
    def update(id:, name: nil, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/call/#{id}"
        end
        Vapi::Call.from_json(json_object: response.body)
      end
    end
  end
end
