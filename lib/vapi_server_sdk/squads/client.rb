# frozen_string_literal: true

require_relative "../../requests"
require "date"
require_relative "../types/squad"
require "json"
require_relative "../types/create_squad_dto"
require_relative "../types/squad_member_dto"
require_relative "../types/assistant_overrides"
require "async"

module Vapi
  class SquadsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::SquadsClient]
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
    # @return [Array<Vapi::Squad>]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/squad"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Vapi::Squad.from_json(json_object: item)
      end
    end

    # @param request [Hash] Request of type Vapi::CreateSquadDto, as a Hash
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/squad"
      end
      Vapi::Squad.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/squad/#{id}"
      end
      Vapi::Squad.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
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
        req.url "#{@request_client.get_url(request_options: request_options)}/squad/#{id}"
      end
      Vapi::Squad.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param name [String] This is the name of the squad.
    # @param members [Array<Hash>] This is the list of assistants that make up the squad.
    #  The call will start with the first assistant in the list.Request of type Array<Vapi::SquadMemberDto>, as a Hash
    #   * :assistant_id (String)
    #   * :assistant (Hash)
    #     * :transcriber (Hash)
    #     * :model (Hash)
    #     * :voice (Hash)
    #     * :first_message (String)
    #     * :first_message_interruptions_enabled (Boolean)
    #     * :first_message_mode (Vapi::CreateAssistantDtoFirstMessageMode)
    #     * :voicemail_detection (Hash)
    #     * :client_messages (Array<Vapi::CreateAssistantDtoClientMessagesItem>)
    #     * :server_messages (Array<Vapi::CreateAssistantDtoServerMessagesItem>)
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
    #     * :credentials (Array<Vapi::CreateAssistantDtoCredentialsItem>)
    #     * :hooks (Array<Vapi::CreateAssistantDtoHooksItem>)
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
    #   * :assistant_destinations (Array<Vapi::TransferDestinationAssistant>)
    # @param members_overrides [Hash] This can be used to override all the assistants' settings and provide values for
    #  their template variables.
    #  Both `membersOverrides` and `members[n].assistantOverrides` can be used
    #  together. First, `members[n].assistantOverrides` is applied. Then,
    #  `membersOverrides` is applied as a global override.Request of type Vapi::AssistantOverrides, as a Hash
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
    def update(id:, members:, name: nil, members_overrides: nil, request_options: nil)
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
          members: members,
          membersOverrides: members_overrides
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/squad/#{id}"
      end
      Vapi::Squad.from_json(json_object: response.body)
    end
  end

  class AsyncSquadsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncSquadsClient]
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
    # @return [Array<Vapi::Squad>]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/squad"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Vapi::Squad.from_json(json_object: item)
        end
      end
    end

    # @param request [Hash] Request of type Vapi::CreateSquadDto, as a Hash
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/squad"
        end
        Vapi::Squad.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/squad/#{id}"
        end
        Vapi::Squad.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/squad/#{id}"
        end
        Vapi::Squad.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param name [String] This is the name of the squad.
    # @param members [Array<Hash>] This is the list of assistants that make up the squad.
    #  The call will start with the first assistant in the list.Request of type Array<Vapi::SquadMemberDto>, as a Hash
    #   * :assistant_id (String)
    #   * :assistant (Hash)
    #     * :transcriber (Hash)
    #     * :model (Hash)
    #     * :voice (Hash)
    #     * :first_message (String)
    #     * :first_message_interruptions_enabled (Boolean)
    #     * :first_message_mode (Vapi::CreateAssistantDtoFirstMessageMode)
    #     * :voicemail_detection (Hash)
    #     * :client_messages (Array<Vapi::CreateAssistantDtoClientMessagesItem>)
    #     * :server_messages (Array<Vapi::CreateAssistantDtoServerMessagesItem>)
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
    #     * :credentials (Array<Vapi::CreateAssistantDtoCredentialsItem>)
    #     * :hooks (Array<Vapi::CreateAssistantDtoHooksItem>)
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
    #   * :assistant_destinations (Array<Vapi::TransferDestinationAssistant>)
    # @param members_overrides [Hash] This can be used to override all the assistants' settings and provide values for
    #  their template variables.
    #  Both `membersOverrides` and `members[n].assistantOverrides` can be used
    #  together. First, `members[n].assistantOverrides` is applied. Then,
    #  `membersOverrides` is applied as a global override.Request of type Vapi::AssistantOverrides, as a Hash
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Squad]
    def update(id:, members:, name: nil, members_overrides: nil, request_options: nil)
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
            members: members,
            membersOverrides: members_overrides
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/squad/#{id}"
        end
        Vapi::Squad.from_json(json_object: response.body)
      end
    end
  end
end
