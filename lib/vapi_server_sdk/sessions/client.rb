# frozen_string_literal: true
require_relative "../../requests"
require_relative "types/sessions_list_request_sort_order"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "../types/session_paginated_response"
require_relative "types/create_session_dto_status"
require_relative "../types/create_assistant_dto"
require_relative "types/create_session_dto_messages_item"
require_relative "../types/create_customer_dto"
require_relative "../types/import_twilio_phone_number_dto"
require_relative "../types/session"
require_relative "types/update_session_dto_status"
require_relative "types/update_session_dto_messages_item"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vapi
  class SessionsClient
  # @return [Vapi::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vapi::RequestClient] 
    # @return [Vapi::SessionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param name [String] This is the name of the session to filter by.
    # @param assistant_id [String] This is the ID of the assistant to filter sessions by.
    # @param workflow_id [String] This is the ID of the workflow to filter sessions by.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Sessions::SessionsListRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    def list(name: nil, assistant_id: nil, workflow_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "name": name, "assistantId": assistant_id, "workflowId": workflow_id, "page": page, "sortOrder": sort_order, "limit": limit, "createdAtGt": created_at_gt, "createdAtLt": created_at_lt, "createdAtGe": created_at_ge, "createdAtLe": created_at_le, "updatedAtGt": updated_at_gt, "updatedAtLt": updated_at_lt, "updatedAtGe": updated_at_ge, "updatedAtLe": updated_at_le }.compact
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
    #   * :silence_timeout_seconds (Float) 
    #   * :max_duration_seconds (Float) 
    #   * :background_sound (Hash)
    #   * :background_denoising_enabled (Boolean) 
    #   * :model_output_in_messages_enabled (Boolean) 
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>) 
    #   * :observability_plan (Hash)
    #     * :provider (String) 
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
    #   * :artifact_plan (Hash)
    #     * :recording_enabled (Boolean) 
    #     * :recording_format (Vapi::ArtifactPlanRecordingFormat) 
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
    #     * :idle_message_reset_count_on_user_speech_enabled (Boolean) 
    #     * :idle_timeout_seconds (Float) 
    #     * :silence_timeout_message (String) 
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
    #     * :url (String) 
    #     * :headers (Hash{String => Object}) 
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object}) 
    #       * :max_retries (Float) 
    #       * :base_delay_seconds (Float) 
    #   * :keypad_input_plan (Hash)
    #     * :enabled (Boolean) 
    #     * :timeout_seconds (Float) 
    #     * :delimiters (Vapi::KeypadInputPlanDelimiters) 
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
    #     * :silence_timeout_seconds (Float) 
    #     * :max_duration_seconds (Float) 
    #     * :background_sound (Hash)
    #     * :background_denoising_enabled (Boolean) 
    #     * :model_output_in_messages_enabled (Boolean) 
    #     * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>) 
    #     * :observability_plan (Hash)
    #       * :provider (String) 
    #       * :tags (Array<String>) 
    #       * :metadata (Hash{String => Object}) 
    #     * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>) 
    #     * :hooks (Array<Vapi::AssistantOverridesHooksItem>) 
    #     * :variable_values (Hash{String => Object}) 
    #     * :name (String) 
    #     * :voicemail_message (String) 
    #     * :end_call_message (String) 
    #     * :end_call_phrases (Array<String>) 
    #     * :compliance_plan (Hash)
    #       * :hipaa_enabled (Boolean) 
    #       * :pci_enabled (Boolean) 
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
    #     * :artifact_plan (Hash)
    #       * :recording_enabled (Boolean) 
    #       * :recording_format (Vapi::ArtifactPlanRecordingFormat) 
    #       * :video_recording_enabled (Boolean) 
    #       * :pcap_enabled (Boolean) 
    #       * :pcap_s_3_path_prefix (String) 
    #       * :transcript_plan (Hash)
    #         * :enabled (Boolean) 
    #         * :assistant_name (String) 
    #         * :user_name (String) 
    #       * :recording_path (String) 
    #     * :message_plan (Hash)
    #       * :idle_messages (Array<String>) 
    #       * :idle_message_max_spoken_count (Float) 
    #       * :idle_message_reset_count_on_user_speech_enabled (Boolean) 
    #       * :idle_timeout_seconds (Float) 
    #       * :silence_timeout_message (String) 
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
    #       * :url (String) 
    #       * :headers (Hash{String => Object}) 
    #       * :backoff_plan (Hash)
    #         * :type (Hash{String => Object}) 
    #         * :max_retries (Float) 
    #         * :base_delay_seconds (Float) 
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
    #   * :hooks (Array<Vapi::PhoneNumberHookCallRinging>) 
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
    #     * :url (String) 
    #     * :headers (Hash{String => Object}) 
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object}) 
    #       * :max_retries (Float) 
    #       * :base_delay_seconds (Float) 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Session]
    def create(name: nil, status: nil, expiration_seconds: nil, assistant_id: nil, assistant: nil, messages: nil, customer: nil, phone_number_id: nil, phone_number: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, status: status, expirationSeconds: expiration_seconds, assistantId: assistant_id, assistant: assistant, messages: messages, customer: customer, phoneNumberId: phone_number_id, phoneNumber: phone_number }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/session"
end
      Vapi::Session.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Session]
    def get(id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
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
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
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
      response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, status: status, expirationSeconds: expiration_seconds, messages: messages }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
end
      Vapi::Session.from_json(json_object: response.body)
    end
  end
  class AsyncSessionsClient
  # @return [Vapi::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vapi::RequestClient] 
    # @return [Vapi::AsyncSessionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param name [String] This is the name of the session to filter by.
    # @param assistant_id [String] This is the ID of the assistant to filter sessions by.
    # @param workflow_id [String] This is the ID of the workflow to filter sessions by.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Sessions::SessionsListRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    def list(name: nil, assistant_id: nil, workflow_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "name": name, "assistantId": assistant_id, "workflowId": workflow_id, "page": page, "sortOrder": sort_order, "limit": limit, "createdAtGt": created_at_gt, "createdAtLt": created_at_lt, "createdAtGe": created_at_ge, "createdAtLe": created_at_le, "updatedAtGt": updated_at_gt, "updatedAtLt": updated_at_lt, "updatedAtGe": updated_at_ge, "updatedAtLe": updated_at_le }.compact
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
    #   * :silence_timeout_seconds (Float) 
    #   * :max_duration_seconds (Float) 
    #   * :background_sound (Hash)
    #   * :background_denoising_enabled (Boolean) 
    #   * :model_output_in_messages_enabled (Boolean) 
    #   * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>) 
    #   * :observability_plan (Hash)
    #     * :provider (String) 
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
    #   * :artifact_plan (Hash)
    #     * :recording_enabled (Boolean) 
    #     * :recording_format (Vapi::ArtifactPlanRecordingFormat) 
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
    #     * :idle_message_reset_count_on_user_speech_enabled (Boolean) 
    #     * :idle_timeout_seconds (Float) 
    #     * :silence_timeout_message (String) 
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
    #     * :url (String) 
    #     * :headers (Hash{String => Object}) 
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object}) 
    #       * :max_retries (Float) 
    #       * :base_delay_seconds (Float) 
    #   * :keypad_input_plan (Hash)
    #     * :enabled (Boolean) 
    #     * :timeout_seconds (Float) 
    #     * :delimiters (Vapi::KeypadInputPlanDelimiters) 
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
    #     * :silence_timeout_seconds (Float) 
    #     * :max_duration_seconds (Float) 
    #     * :background_sound (Hash)
    #     * :background_denoising_enabled (Boolean) 
    #     * :model_output_in_messages_enabled (Boolean) 
    #     * :transport_configurations (Array<Vapi::TransportConfigurationTwilio>) 
    #     * :observability_plan (Hash)
    #       * :provider (String) 
    #       * :tags (Array<String>) 
    #       * :metadata (Hash{String => Object}) 
    #     * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>) 
    #     * :hooks (Array<Vapi::AssistantOverridesHooksItem>) 
    #     * :variable_values (Hash{String => Object}) 
    #     * :name (String) 
    #     * :voicemail_message (String) 
    #     * :end_call_message (String) 
    #     * :end_call_phrases (Array<String>) 
    #     * :compliance_plan (Hash)
    #       * :hipaa_enabled (Boolean) 
    #       * :pci_enabled (Boolean) 
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
    #     * :artifact_plan (Hash)
    #       * :recording_enabled (Boolean) 
    #       * :recording_format (Vapi::ArtifactPlanRecordingFormat) 
    #       * :video_recording_enabled (Boolean) 
    #       * :pcap_enabled (Boolean) 
    #       * :pcap_s_3_path_prefix (String) 
    #       * :transcript_plan (Hash)
    #         * :enabled (Boolean) 
    #         * :assistant_name (String) 
    #         * :user_name (String) 
    #       * :recording_path (String) 
    #     * :message_plan (Hash)
    #       * :idle_messages (Array<String>) 
    #       * :idle_message_max_spoken_count (Float) 
    #       * :idle_message_reset_count_on_user_speech_enabled (Boolean) 
    #       * :idle_timeout_seconds (Float) 
    #       * :silence_timeout_message (String) 
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
    #       * :url (String) 
    #       * :headers (Hash{String => Object}) 
    #       * :backoff_plan (Hash)
    #         * :type (Hash{String => Object}) 
    #         * :max_retries (Float) 
    #         * :base_delay_seconds (Float) 
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
    #   * :hooks (Array<Vapi::PhoneNumberHookCallRinging>) 
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
    #     * :url (String) 
    #     * :headers (Hash{String => Object}) 
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object}) 
    #       * :max_retries (Float) 
    #       * :base_delay_seconds (Float) 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Session]
    def create(name: nil, status: nil, expiration_seconds: nil, assistant_id: nil, assistant: nil, messages: nil, customer: nil, phone_number_id: nil, phone_number: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, status: status, expirationSeconds: expiration_seconds, assistantId: assistant_id, assistant: assistant, messages: messages, customer: customer, phoneNumberId: phone_number_id, phoneNumber: phone_number }.compact
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
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
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
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
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
        response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), name: name, status: status, expirationSeconds: expiration_seconds, messages: messages }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/session/#{id}"
end
        Vapi::Session.from_json(json_object: response.body)
      end
    end
  end
end