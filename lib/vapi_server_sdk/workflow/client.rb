# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/workflow"
require "json"
require_relative "../types/create_workflow_dto"
require_relative "types/update_workflow_dto_nodes_item"
require_relative "types/update_workflow_dto_transcriber"
require_relative "types/update_workflow_dto_voice"
require_relative "../types/langfuse_observability_plan"
require_relative "types/update_workflow_dto_background_sound"
require_relative "types/update_workflow_dto_credentials_item"
require_relative "../types/edge"
require_relative "../types/server"
require_relative "../types/compliance_plan"
require_relative "../types/analysis_plan"
require_relative "../types/artifact_plan"
require_relative "../types/start_speaking_plan"
require_relative "../types/stop_speaking_plan"
require_relative "../types/monitor_plan"
require_relative "../types/background_speech_denoising_plan"
require "async"

module Vapi
  class WorkflowClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::WorkflowClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Vapi::Workflow>]
    def workflow_controller_find_all(request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Vapi::Workflow.from_json(json_object: item)
      end
    end

    # @param request [Hash] Request of type Vapi::CreateWorkflowDto, as a Hash
    #   * :nodes (Array<Vapi::CreateWorkflowDtoNodesItem>)
    #   * :transcriber (Hash)
    #   * :voice (Hash)
    #   * :observability_plan (Hash)
    #     * :provider (String)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :background_sound (Hash)
    #   * :credentials (Array<Vapi::CreateWorkflowDtoCredentialsItem>)
    #   * :name (String)
    #   * :edges (Array<Vapi::Edge>)
    #   * :global_prompt (String)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :url (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object})
    #       * :max_retries (Float)
    #       * :base_delay_seconds (Float)
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_create(request:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
      end
      Vapi::Workflow.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_find_one(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
      end
      Vapi::Workflow.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_delete(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
      end
      Vapi::Workflow.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param nodes [Array<Hash>] Request of type Array<Vapi::Workflow::UpdateWorkflowDtoNodesItem>, as a Hash
    # @param transcriber [Vapi::Workflow::UpdateWorkflowDtoTranscriber] This is the transcriber for the workflow.
    #  This can be overridden at node level using `nodes[n].transcriber`.
    # @param voice [Vapi::Workflow::UpdateWorkflowDtoVoice] This is the voice for the workflow.
    #  This can be overridden at node level using `nodes[n].voice`.
    # @param observability_plan [Hash] This is the plan for observability of workflow's calls.
    #  Currently, only Langfuse is supported.Request of type Vapi::LangfuseObservabilityPlan, as a Hash
    #   * :provider (String)
    #   * :tags (Array<String>)
    #   * :metadata (Hash{String => Object})
    # @param background_sound [Vapi::Workflow::UpdateWorkflowDtoBackgroundSoundZero, String] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    #  You can also provide a custom sound by providing a URL to an audio file.
    # @param credentials [Array<Hash>] These are dynamic credentials that will be used for the workflow calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.Request of type Array<Vapi::Workflow::UpdateWorkflowDtoCredentialsItem>, as a Hash
    # @param name [String]
    # @param edges [Array<Hash>] Request of type Array<Vapi::Edge>, as a Hash
    #   * :condition (Hash)
    #     * :type (String)
    #     * :prompt (String)
    #   * :from (String)
    #   * :to (String)
    #   * :metadata (Hash{String => Object})
    # @param global_prompt [String]
    # @param server [Hash] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. tool.server
    #  2. workflow.server / assistant.server
    #  3. phoneNumber.server
    #  4. org.serverRequest of type Vapi::Server, as a Hash
    #   * :timeout_seconds (Float)
    #   * :url (String)
    #   * :headers (Hash{String => Object})
    #   * :backoff_plan (Hash)
    #     * :type (Hash{String => Object})
    #     * :max_retries (Float)
    #     * :base_delay_seconds (Float)
    # @param compliance_plan [Hash] This is the compliance plan for the workflow. It allows you to configure HIPAA
    #  and other compliance settings.Request of type Vapi::CompliancePlan, as a Hash
    #   * :hipaa_enabled (Boolean)
    #   * :pci_enabled (Boolean)
    # @param analysis_plan [Hash] This is the plan for analysis of workflow's calls. Stored in `call.analysis`.Request of type Vapi::AnalysisPlan, as a Hash
    #   * :min_messages_threshold (Float)
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
    #       * :pattern (String)
    #       * :format (Vapi::JsonSchemaFormat)
    #       * :required (Array<String>)
    #       * :enum (Array<String>)
    #       * :title (String)
    #     * :timeout_seconds (Float)
    #   * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #   * :success_evaluation_plan (Hash)
    #     * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    # @param artifact_plan [Hash] This is the plan for artifacts generated during workflow's calls. Stored in
    #  `call.artifact`.Request of type Vapi::ArtifactPlan, as a Hash
    #   * :recording_enabled (Boolean)
    #   * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #   * :video_recording_enabled (Boolean)
    #   * :pcap_enabled (Boolean)
    #   * :pcap_s_3_path_prefix (String)
    #   * :transcript_plan (Hash)
    #     * :enabled (Boolean)
    #     * :assistant_name (String)
    #     * :user_name (String)
    #   * :recording_path (String)
    # @param start_speaking_plan [Hash] This is the plan for when the workflow nodes should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.Request of type Vapi::StartSpeakingPlan, as a Hash
    #   * :wait_seconds (Float)
    #   * :smart_endpointing_enabled (Hash)
    #   * :smart_endpointing_plan (Hash)
    #   * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #   * :transcription_endpointing_plan (Hash)
    #     * :on_punctuation_seconds (Float)
    #     * :on_no_punctuation_seconds (Float)
    #     * :on_number_seconds (Float)
    # @param stop_speaking_plan [Hash] This is the plan for when workflow nodes should stop talking on customer
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
    # @param monitor_plan [Hash] This is the plan for real-time monitoring of the workflow's calls.
    #  Usage:
    #  - To enable live listening of the workflow's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the workflow's calls, set
    #  `monitorPlan.controlEnabled` to `true`.Request of type Vapi::MonitorPlan, as a Hash
    #   * :listen_enabled (Boolean)
    #   * :listen_authentication_enabled (Boolean)
    #   * :control_enabled (Boolean)
    #   * :control_authentication_enabled (Boolean)
    # @param background_speech_denoising_plan [Hash] This enables filtering of noise and background speech while the user is talking.
    #  Features:
    #  - Smart denoising using Krisp
    #  - Fourier denoising
    #  Both can be used together. Order of precedence:
    #  - Smart denoising
    #  - Fourier denoisingRequest of type Vapi::BackgroundSpeechDenoisingPlan, as a Hash
    #   * :smart_denoising_plan (Hash)
    #     * :enabled (Boolean)
    #   * :fourier_denoising_plan (Hash)
    #     * :enabled (Boolean)
    #     * :media_detection_enabled (Boolean)
    #     * :static_threshold (Float)
    #     * :baseline_offset_db (Float)
    #     * :window_size_ms (Float)
    #     * :baseline_percentile (Float)
    # @param credential_ids [Array<String>] These are the credentials that will be used for the workflow calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_update(id:, nodes: nil, transcriber: nil, voice: nil, observability_plan: nil,
                                   background_sound: nil, credentials: nil, name: nil, edges: nil, global_prompt: nil, server: nil, compliance_plan: nil, analysis_plan: nil, artifact_plan: nil, start_speaking_plan: nil, stop_speaking_plan: nil, monitor_plan: nil, background_speech_denoising_plan: nil, credential_ids: nil, request_options: nil)
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
          nodes: nodes,
          transcriber: transcriber,
          voice: voice,
          observabilityPlan: observability_plan,
          backgroundSound: background_sound,
          credentials: credentials,
          name: name,
          edges: edges,
          globalPrompt: global_prompt,
          server: server,
          compliancePlan: compliance_plan,
          analysisPlan: analysis_plan,
          artifactPlan: artifact_plan,
          startSpeakingPlan: start_speaking_plan,
          stopSpeakingPlan: stop_speaking_plan,
          monitorPlan: monitor_plan,
          backgroundSpeechDenoisingPlan: background_speech_denoising_plan,
          credentialIds: credential_ids
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
      end
      Vapi::Workflow.from_json(json_object: response.body)
    end
  end

  class AsyncWorkflowClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncWorkflowClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Vapi::Workflow>]
    def workflow_controller_find_all(request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Vapi::Workflow.from_json(json_object: item)
        end
      end
    end

    # @param request [Hash] Request of type Vapi::CreateWorkflowDto, as a Hash
    #   * :nodes (Array<Vapi::CreateWorkflowDtoNodesItem>)
    #   * :transcriber (Hash)
    #   * :voice (Hash)
    #   * :observability_plan (Hash)
    #     * :provider (String)
    #     * :tags (Array<String>)
    #     * :metadata (Hash{String => Object})
    #   * :background_sound (Hash)
    #   * :credentials (Array<Vapi::CreateWorkflowDtoCredentialsItem>)
    #   * :name (String)
    #   * :edges (Array<Vapi::Edge>)
    #   * :global_prompt (String)
    #   * :server (Hash)
    #     * :timeout_seconds (Float)
    #     * :url (String)
    #     * :headers (Hash{String => Object})
    #     * :backoff_plan (Hash)
    #       * :type (Hash{String => Object})
    #       * :max_retries (Float)
    #       * :base_delay_seconds (Float)
    #   * :compliance_plan (Hash)
    #     * :hipaa_enabled (Boolean)
    #     * :pci_enabled (Boolean)
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
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_create(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
        end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_find_one(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
        end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_delete(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
        end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param nodes [Array<Hash>] Request of type Array<Vapi::Workflow::UpdateWorkflowDtoNodesItem>, as a Hash
    # @param transcriber [Vapi::Workflow::UpdateWorkflowDtoTranscriber] This is the transcriber for the workflow.
    #  This can be overridden at node level using `nodes[n].transcriber`.
    # @param voice [Vapi::Workflow::UpdateWorkflowDtoVoice] This is the voice for the workflow.
    #  This can be overridden at node level using `nodes[n].voice`.
    # @param observability_plan [Hash] This is the plan for observability of workflow's calls.
    #  Currently, only Langfuse is supported.Request of type Vapi::LangfuseObservabilityPlan, as a Hash
    #   * :provider (String)
    #   * :tags (Array<String>)
    #   * :metadata (Hash{String => Object})
    # @param background_sound [Vapi::Workflow::UpdateWorkflowDtoBackgroundSoundZero, String] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    #  You can also provide a custom sound by providing a URL to an audio file.
    # @param credentials [Array<Hash>] These are dynamic credentials that will be used for the workflow calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.Request of type Array<Vapi::Workflow::UpdateWorkflowDtoCredentialsItem>, as a Hash
    # @param name [String]
    # @param edges [Array<Hash>] Request of type Array<Vapi::Edge>, as a Hash
    #   * :condition (Hash)
    #     * :type (String)
    #     * :prompt (String)
    #   * :from (String)
    #   * :to (String)
    #   * :metadata (Hash{String => Object})
    # @param global_prompt [String]
    # @param server [Hash] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. tool.server
    #  2. workflow.server / assistant.server
    #  3. phoneNumber.server
    #  4. org.serverRequest of type Vapi::Server, as a Hash
    #   * :timeout_seconds (Float)
    #   * :url (String)
    #   * :headers (Hash{String => Object})
    #   * :backoff_plan (Hash)
    #     * :type (Hash{String => Object})
    #     * :max_retries (Float)
    #     * :base_delay_seconds (Float)
    # @param compliance_plan [Hash] This is the compliance plan for the workflow. It allows you to configure HIPAA
    #  and other compliance settings.Request of type Vapi::CompliancePlan, as a Hash
    #   * :hipaa_enabled (Boolean)
    #   * :pci_enabled (Boolean)
    # @param analysis_plan [Hash] This is the plan for analysis of workflow's calls. Stored in `call.analysis`.Request of type Vapi::AnalysisPlan, as a Hash
    #   * :min_messages_threshold (Float)
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
    #       * :pattern (String)
    #       * :format (Vapi::JsonSchemaFormat)
    #       * :required (Array<String>)
    #       * :enum (Array<String>)
    #       * :title (String)
    #     * :timeout_seconds (Float)
    #   * :structured_data_multi_plan (Array<Vapi::StructuredDataMultiPlan>)
    #   * :success_evaluation_plan (Hash)
    #     * :rubric (Vapi::SuccessEvaluationPlanRubric)
    #     * :messages (Array<Hash{String => Object}>)
    #     * :enabled (Boolean)
    #     * :timeout_seconds (Float)
    # @param artifact_plan [Hash] This is the plan for artifacts generated during workflow's calls. Stored in
    #  `call.artifact`.Request of type Vapi::ArtifactPlan, as a Hash
    #   * :recording_enabled (Boolean)
    #   * :recording_format (Vapi::ArtifactPlanRecordingFormat)
    #   * :video_recording_enabled (Boolean)
    #   * :pcap_enabled (Boolean)
    #   * :pcap_s_3_path_prefix (String)
    #   * :transcript_plan (Hash)
    #     * :enabled (Boolean)
    #     * :assistant_name (String)
    #     * :user_name (String)
    #   * :recording_path (String)
    # @param start_speaking_plan [Hash] This is the plan for when the workflow nodes should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.Request of type Vapi::StartSpeakingPlan, as a Hash
    #   * :wait_seconds (Float)
    #   * :smart_endpointing_enabled (Hash)
    #   * :smart_endpointing_plan (Hash)
    #   * :custom_endpointing_rules (Array<Vapi::StartSpeakingPlanCustomEndpointingRulesItem>)
    #   * :transcription_endpointing_plan (Hash)
    #     * :on_punctuation_seconds (Float)
    #     * :on_no_punctuation_seconds (Float)
    #     * :on_number_seconds (Float)
    # @param stop_speaking_plan [Hash] This is the plan for when workflow nodes should stop talking on customer
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
    # @param monitor_plan [Hash] This is the plan for real-time monitoring of the workflow's calls.
    #  Usage:
    #  - To enable live listening of the workflow's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the workflow's calls, set
    #  `monitorPlan.controlEnabled` to `true`.Request of type Vapi::MonitorPlan, as a Hash
    #   * :listen_enabled (Boolean)
    #   * :listen_authentication_enabled (Boolean)
    #   * :control_enabled (Boolean)
    #   * :control_authentication_enabled (Boolean)
    # @param background_speech_denoising_plan [Hash] This enables filtering of noise and background speech while the user is talking.
    #  Features:
    #  - Smart denoising using Krisp
    #  - Fourier denoising
    #  Both can be used together. Order of precedence:
    #  - Smart denoising
    #  - Fourier denoisingRequest of type Vapi::BackgroundSpeechDenoisingPlan, as a Hash
    #   * :smart_denoising_plan (Hash)
    #     * :enabled (Boolean)
    #   * :fourier_denoising_plan (Hash)
    #     * :enabled (Boolean)
    #     * :media_detection_enabled (Boolean)
    #     * :static_threshold (Float)
    #     * :baseline_offset_db (Float)
    #     * :window_size_ms (Float)
    #     * :baseline_percentile (Float)
    # @param credential_ids [Array<String>] These are the credentials that will be used for the workflow calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Workflow]
    def workflow_controller_update(id:, nodes: nil, transcriber: nil, voice: nil, observability_plan: nil,
                                   background_sound: nil, credentials: nil, name: nil, edges: nil, global_prompt: nil, server: nil, compliance_plan: nil, analysis_plan: nil, artifact_plan: nil, start_speaking_plan: nil, stop_speaking_plan: nil, monitor_plan: nil, background_speech_denoising_plan: nil, credential_ids: nil, request_options: nil)
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
            nodes: nodes,
            transcriber: transcriber,
            voice: voice,
            observabilityPlan: observability_plan,
            backgroundSound: background_sound,
            credentials: credentials,
            name: name,
            edges: edges,
            globalPrompt: global_prompt,
            server: server,
            compliancePlan: compliance_plan,
            analysisPlan: analysis_plan,
            artifactPlan: artifact_plan,
            startSpeakingPlan: start_speaking_plan,
            stopSpeakingPlan: stop_speaking_plan,
            monitorPlan: monitor_plan,
            backgroundSpeechDenoisingPlan: background_speech_denoising_plan,
            credentialIds: credential_ids
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
        end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end
  end
end
