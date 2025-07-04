# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/chats_list_request_sort_order"
require "date"
require_relative "../types/chat_paginated_response"
require_relative "../types/create_assistant_dto"
require_relative "../types/assistant_overrides"
require_relative "types/create_chat_dto_input"
require_relative "types/chats_create_response"
require_relative "../types/chat"
require_relative "types/open_ai_responses_request_input"
require_relative "types/chats_create_response_response"
require "async"

module Vapi
  class ChatsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::ChatsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param assistant_id [String] This is the unique identifier for the assistant that will be used for the chat.
    # @param workflow_id [String] This is the unique identifier for the workflow that will be used for the chat.
    # @param session_id [String] This is the unique identifier for the session that will be used for the chat.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Chats::ChatsListRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::ChatPaginatedResponse]
    def list(assistant_id: nil, workflow_id: nil, session_id: nil, page: nil, sort_order: nil, limit: nil,
             created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          "assistantId": assistant_id,
          "workflowId": workflow_id,
          "sessionId": session_id,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/chat"
      end
      Vapi::ChatPaginatedResponse.from_json(json_object: response.body)
    end

    # Creates a new chat. Requires at least one of: assistantId/assistant, sessionId,
    #  or previousChatId. Note: sessionId and previousChatId are mutually exclusive.
    #
    # @param assistant_id [String] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.
    # @param assistant [Hash] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.Request of type Vapi::CreateAssistantDto, as a Hash
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
    # @param assistant_overrides [Hash] These are the variable values that will be used to replace template variables in
    #  the assistant messages.
    #  Only variable substitution is supported in chat contexts - other assistant
    #  properties cannot be overridden.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
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
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param name [String] This is the name of the chat. This is just for your own reference.
    # @param session_id [String] This is the ID of the session that will be used for the chat.
    #  Mutually exclusive with previousChatId.
    # @param input [String, Array<Vapi::Chats::CreateChatDtoInputItem>] This is the input text for the chat.
    #  Can be a string or an array of chat messages.
    #  This field is REQUIRED for chat creation.
    # @param stream [Boolean] This is a flag that determines whether the response should be streamed.
    #  When true, the response will be sent as chunks of text.
    # @param previous_chat_id [String] This is the ID of the chat that will be used as context for the new chat.
    #  The messages from the previous chat will be used as context.
    #  Mutually exclusive with sessionId.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Chat, Vapi::CreateChatStreamResponse]
    def create(input:, assistant_id: nil, assistant: nil, assistant_overrides: nil, name: nil, session_id: nil,
               stream: nil, previous_chat_id: nil, request_options: nil)
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
          assistantId: assistant_id,
          assistant: assistant,
          assistantOverrides: assistant_overrides,
          name: name,
          sessionId: session_id,
          input: input,
          stream: stream,
          previousChatId: previous_chat_id
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/chat"
      end
      Vapi::Chats::ChatsCreateResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Chat]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/chat/#{id}"
      end
      Vapi::Chat.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Chat]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/chat/#{id}"
      end
      Vapi::Chat.from_json(json_object: response.body)
    end

    # @param assistant_id [String] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.
    # @param assistant [Hash] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.Request of type Vapi::CreateAssistantDto, as a Hash
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
    # @param assistant_overrides [Hash] These are the variable values that will be used to replace template variables in
    #  the assistant messages.
    #  Only variable substitution is supported in chat contexts - other assistant
    #  properties cannot be overridden.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
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
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param name [String] This is the name of the chat. This is just for your own reference.
    # @param session_id [String] This is the ID of the session that will be used for the chat.
    #  Mutually exclusive with previousChatId.
    # @param input [String, Array<Vapi::Chats::OpenAiResponsesRequestInputItem>] This is the input text for the chat.
    #  Can be a string or an array of chat messages.
    #  This field is REQUIRED for chat creation.
    # @param stream [Boolean] Whether to stream the response or not.
    # @param previous_chat_id [String] This is the ID of the chat that will be used as context for the new chat.
    #  The messages from the previous chat will be used as context.
    #  Mutually exclusive with sessionId.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ResponseObject, Vapi::ResponseTextDeltaEvent, Vapi::ResponseTextDoneEvent, Vapi::ResponseCompletedEvent, Vapi::ResponseErrorEvent]
    def create_response(input:, assistant_id: nil, assistant: nil, assistant_overrides: nil, name: nil,
                        session_id: nil, stream: nil, previous_chat_id: nil, request_options: nil)
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
          assistantId: assistant_id,
          assistant: assistant,
          assistantOverrides: assistant_overrides,
          name: name,
          sessionId: session_id,
          input: input,
          stream: stream,
          previousChatId: previous_chat_id
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/chat/responses"
      end
      Vapi::Chats::ChatsCreateResponseResponse.from_json(json_object: response.body)
    end
  end

  class AsyncChatsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncChatsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param assistant_id [String] This is the unique identifier for the assistant that will be used for the chat.
    # @param workflow_id [String] This is the unique identifier for the workflow that will be used for the chat.
    # @param session_id [String] This is the unique identifier for the session that will be used for the chat.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Chats::ChatsListRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::ChatPaginatedResponse]
    def list(assistant_id: nil, workflow_id: nil, session_id: nil, page: nil, sort_order: nil, limit: nil,
             created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
            "assistantId": assistant_id,
            "workflowId": workflow_id,
            "sessionId": session_id,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/chat"
        end
        Vapi::ChatPaginatedResponse.from_json(json_object: response.body)
      end
    end

    # Creates a new chat. Requires at least one of: assistantId/assistant, sessionId,
    #  or previousChatId. Note: sessionId and previousChatId are mutually exclusive.
    #
    # @param assistant_id [String] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.
    # @param assistant [Hash] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.Request of type Vapi::CreateAssistantDto, as a Hash
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
    # @param assistant_overrides [Hash] These are the variable values that will be used to replace template variables in
    #  the assistant messages.
    #  Only variable substitution is supported in chat contexts - other assistant
    #  properties cannot be overridden.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
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
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param name [String] This is the name of the chat. This is just for your own reference.
    # @param session_id [String] This is the ID of the session that will be used for the chat.
    #  Mutually exclusive with previousChatId.
    # @param input [String, Array<Vapi::Chats::CreateChatDtoInputItem>] This is the input text for the chat.
    #  Can be a string or an array of chat messages.
    #  This field is REQUIRED for chat creation.
    # @param stream [Boolean] This is a flag that determines whether the response should be streamed.
    #  When true, the response will be sent as chunks of text.
    # @param previous_chat_id [String] This is the ID of the chat that will be used as context for the new chat.
    #  The messages from the previous chat will be used as context.
    #  Mutually exclusive with sessionId.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Chat, Vapi::CreateChatStreamResponse]
    def create(input:, assistant_id: nil, assistant: nil, assistant_overrides: nil, name: nil, session_id: nil,
               stream: nil, previous_chat_id: nil, request_options: nil)
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
            assistantId: assistant_id,
            assistant: assistant,
            assistantOverrides: assistant_overrides,
            name: name,
            sessionId: session_id,
            input: input,
            stream: stream,
            previousChatId: previous_chat_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/chat"
        end
        Vapi::Chats::ChatsCreateResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Chat]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/chat/#{id}"
        end
        Vapi::Chat.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Chat]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/chat/#{id}"
        end
        Vapi::Chat.from_json(json_object: response.body)
      end
    end

    # @param assistant_id [String] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.
    # @param assistant [Hash] This is the assistant that will be used for the chat. To use an existing
    #  assistant, use `assistantId` instead.Request of type Vapi::CreateAssistantDto, as a Hash
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
    # @param assistant_overrides [Hash] These are the variable values that will be used to replace template variables in
    #  the assistant messages.
    #  Only variable substitution is supported in chat contexts - other assistant
    #  properties cannot be overridden.Request of type Vapi::AssistantOverrides, as a Hash
    #   * :transcriber (Hash)
    #   * :model (Hash)
    #   * :voice (Hash)
    #   * :first_message (String)
    #   * :first_message_interruptions_enabled (Boolean)
    #   * :first_message_mode (Vapi::AssistantOverridesFirstMessageMode)
    #   * :voicemail_detection (Hash)
    #   * :client_messages (Array<Vapi::AssistantOverridesClientMessagesItem>)
    #   * :server_messages (Array<Vapi::AssistantOverridesServerMessagesItem>)
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
    #   * :credentials (Array<Vapi::AssistantOverridesCredentialsItem>)
    #   * :hooks (Array<Vapi::AssistantOverridesHooksItem>)
    #   * :variable_values (Hash{String => Object})
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
    # @param name [String] This is the name of the chat. This is just for your own reference.
    # @param session_id [String] This is the ID of the session that will be used for the chat.
    #  Mutually exclusive with previousChatId.
    # @param input [String, Array<Vapi::Chats::OpenAiResponsesRequestInputItem>] This is the input text for the chat.
    #  Can be a string or an array of chat messages.
    #  This field is REQUIRED for chat creation.
    # @param stream [Boolean] Whether to stream the response or not.
    # @param previous_chat_id [String] This is the ID of the chat that will be used as context for the new chat.
    #  The messages from the previous chat will be used as context.
    #  Mutually exclusive with sessionId.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ResponseObject, Vapi::ResponseTextDeltaEvent, Vapi::ResponseTextDoneEvent, Vapi::ResponseCompletedEvent, Vapi::ResponseErrorEvent]
    def create_response(input:, assistant_id: nil, assistant: nil, assistant_overrides: nil, name: nil,
                        session_id: nil, stream: nil, previous_chat_id: nil, request_options: nil)
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
            assistantId: assistant_id,
            assistant: assistant,
            assistantOverrides: assistant_overrides,
            name: name,
            sessionId: session_id,
            input: input,
            stream: stream,
            previousChatId: previous_chat_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/chat/responses"
        end
        Vapi::Chats::ChatsCreateResponseResponse.from_json(json_object: response.body)
      end
    end
  end
end
