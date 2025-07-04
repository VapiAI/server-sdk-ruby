# frozen_string_literal: true

require_relative "workflow_user_editable_nodes_item"
require_relative "workflow_user_editable_transcriber"
require_relative "workflow_user_editable_voice"
require_relative "langfuse_observability_plan"
require_relative "workflow_user_editable_background_sound"
require_relative "workflow_user_editable_credentials_item"
require_relative "edge"
require_relative "server"
require_relative "compliance_plan"
require_relative "analysis_plan"
require_relative "artifact_plan"
require_relative "start_speaking_plan"
require_relative "stop_speaking_plan"
require_relative "monitor_plan"
require_relative "background_speech_denoising_plan"
require "ostruct"
require "json"

module Vapi
  class WorkflowUserEditable
    # @return [Array<Vapi::WorkflowUserEditableNodesItem>]
    attr_reader :nodes
    # @return [Vapi::WorkflowUserEditableTranscriber] This is the transcriber for the workflow.
    #  This can be overridden at node level using `nodes[n].transcriber`.
    attr_reader :transcriber
    # @return [Vapi::WorkflowUserEditableVoice] This is the voice for the workflow.
    #  This can be overridden at node level using `nodes[n].voice`.
    attr_reader :voice
    # @return [Vapi::LangfuseObservabilityPlan] This is the plan for observability of workflow's calls.
    #  Currently, only Langfuse is supported.
    attr_reader :observability_plan
    # @return [Vapi::WorkflowUserEditableBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    #  You can also provide a custom sound by providing a URL to an audio file.
    attr_reader :background_sound
    # @return [Array<Vapi::WorkflowUserEditableCredentialsItem>] These are dynamic credentials that will be used for the workflow calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.
    attr_reader :credentials
    # @return [String]
    attr_reader :name
    # @return [Array<Vapi::Edge>]
    attr_reader :edges
    # @return [String]
    attr_reader :global_prompt
    # @return [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. tool.server
    #  2. workflow.server / assistant.server
    #  3. phoneNumber.server
    #  4. org.server
    attr_reader :server
    # @return [Vapi::CompliancePlan] This is the compliance plan for the workflow. It allows you to configure HIPAA
    #  and other compliance settings.
    attr_reader :compliance_plan
    # @return [Vapi::AnalysisPlan] This is the plan for analysis of workflow's calls. Stored in `call.analysis`.
    attr_reader :analysis_plan
    # @return [Vapi::ArtifactPlan] This is the plan for artifacts generated during workflow's calls. Stored in
    #  `call.artifact`.
    attr_reader :artifact_plan
    # @return [Vapi::StartSpeakingPlan] This is the plan for when the workflow nodes should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.
    attr_reader :start_speaking_plan
    # @return [Vapi::StopSpeakingPlan] This is the plan for when workflow nodes should stop talking on customer
    #  interruption.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to recognize customer's interruption.
    #  - The assistant is too fast to recognize customer's interruption.
    #  - The assistant is getting interrupted by phrases that are just acknowledgments.
    #  - The assistant is getting interrupted by background noises.
    #  - The assistant is not properly stopping -- it starts talking right after
    #  getting interrupted.
    attr_reader :stop_speaking_plan
    # @return [Vapi::MonitorPlan] This is the plan for real-time monitoring of the workflow's calls.
    #  Usage:
    #  - To enable live listening of the workflow's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the workflow's calls, set
    #  `monitorPlan.controlEnabled` to `true`.
    attr_reader :monitor_plan
    # @return [Vapi::BackgroundSpeechDenoisingPlan] This enables filtering of noise and background speech while the user is talking.
    #  Features:
    #  - Smart denoising using Krisp
    #  - Fourier denoising
    #  Both can be used together. Order of precedence:
    #  - Smart denoising
    #  - Fourier denoising
    attr_reader :background_speech_denoising_plan
    # @return [Array<String>] These are the credentials that will be used for the workflow calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    attr_reader :credential_ids
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param nodes [Array<Vapi::WorkflowUserEditableNodesItem>]
    # @param transcriber [Vapi::WorkflowUserEditableTranscriber] This is the transcriber for the workflow.
    #  This can be overridden at node level using `nodes[n].transcriber`.
    # @param voice [Vapi::WorkflowUserEditableVoice] This is the voice for the workflow.
    #  This can be overridden at node level using `nodes[n].voice`.
    # @param observability_plan [Vapi::LangfuseObservabilityPlan] This is the plan for observability of workflow's calls.
    #  Currently, only Langfuse is supported.
    # @param background_sound [Vapi::WorkflowUserEditableBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    #  You can also provide a custom sound by providing a URL to an audio file.
    # @param credentials [Array<Vapi::WorkflowUserEditableCredentialsItem>] These are dynamic credentials that will be used for the workflow calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.
    # @param name [String]
    # @param edges [Array<Vapi::Edge>]
    # @param global_prompt [String]
    # @param server [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. tool.server
    #  2. workflow.server / assistant.server
    #  3. phoneNumber.server
    #  4. org.server
    # @param compliance_plan [Vapi::CompliancePlan] This is the compliance plan for the workflow. It allows you to configure HIPAA
    #  and other compliance settings.
    # @param analysis_plan [Vapi::AnalysisPlan] This is the plan for analysis of workflow's calls. Stored in `call.analysis`.
    # @param artifact_plan [Vapi::ArtifactPlan] This is the plan for artifacts generated during workflow's calls. Stored in
    #  `call.artifact`.
    # @param start_speaking_plan [Vapi::StartSpeakingPlan] This is the plan for when the workflow nodes should start talking.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to start talking after the customer is done
    #  speaking.
    #  - The assistant is too fast to start talking after the customer is done
    #  speaking.
    #  - The assistant is so fast that it's actually interrupting the customer.
    # @param stop_speaking_plan [Vapi::StopSpeakingPlan] This is the plan for when workflow nodes should stop talking on customer
    #  interruption.
    #  You should configure this if you're running into these issues:
    #  - The assistant is too slow to recognize customer's interruption.
    #  - The assistant is too fast to recognize customer's interruption.
    #  - The assistant is getting interrupted by phrases that are just acknowledgments.
    #  - The assistant is getting interrupted by background noises.
    #  - The assistant is not properly stopping -- it starts talking right after
    #  getting interrupted.
    # @param monitor_plan [Vapi::MonitorPlan] This is the plan for real-time monitoring of the workflow's calls.
    #  Usage:
    #  - To enable live listening of the workflow's calls, set
    #  `monitorPlan.listenEnabled` to `true`.
    #  - To enable live control of the workflow's calls, set
    #  `monitorPlan.controlEnabled` to `true`.
    # @param background_speech_denoising_plan [Vapi::BackgroundSpeechDenoisingPlan] This enables filtering of noise and background speech while the user is talking.
    #  Features:
    #  - Smart denoising using Krisp
    #  - Fourier denoising
    #  Both can be used together. Order of precedence:
    #  - Smart denoising
    #  - Fourier denoising
    # @param credential_ids [Array<String>] These are the credentials that will be used for the workflow calls. By default,
    #  all the credentials are available for use in the call but you can provide a
    #  subset using this.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::WorkflowUserEditable]
    def initialize(nodes:, name:, edges:, transcriber: OMIT, voice: OMIT, observability_plan: OMIT, background_sound: OMIT,
                   credentials: OMIT, global_prompt: OMIT, server: OMIT, compliance_plan: OMIT, analysis_plan: OMIT, artifact_plan: OMIT, start_speaking_plan: OMIT, stop_speaking_plan: OMIT, monitor_plan: OMIT, background_speech_denoising_plan: OMIT, credential_ids: OMIT, additional_properties: nil)
      @nodes = nodes
      @transcriber = transcriber if transcriber != OMIT
      @voice = voice if voice != OMIT
      @observability_plan = observability_plan if observability_plan != OMIT
      @background_sound = background_sound if background_sound != OMIT
      @credentials = credentials if credentials != OMIT
      @name = name
      @edges = edges
      @global_prompt = global_prompt if global_prompt != OMIT
      @server = server if server != OMIT
      @compliance_plan = compliance_plan if compliance_plan != OMIT
      @analysis_plan = analysis_plan if analysis_plan != OMIT
      @artifact_plan = artifact_plan if artifact_plan != OMIT
      @start_speaking_plan = start_speaking_plan if start_speaking_plan != OMIT
      @stop_speaking_plan = stop_speaking_plan if stop_speaking_plan != OMIT
      @monitor_plan = monitor_plan if monitor_plan != OMIT
      @background_speech_denoising_plan = background_speech_denoising_plan if background_speech_denoising_plan != OMIT
      @credential_ids = credential_ids if credential_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "nodes": nodes,
        "transcriber": transcriber,
        "voice": voice,
        "observabilityPlan": observability_plan,
        "backgroundSound": background_sound,
        "credentials": credentials,
        "name": name,
        "edges": edges,
        "globalPrompt": global_prompt,
        "server": server,
        "compliancePlan": compliance_plan,
        "analysisPlan": analysis_plan,
        "artifactPlan": artifact_plan,
        "startSpeakingPlan": start_speaking_plan,
        "stopSpeakingPlan": stop_speaking_plan,
        "monitorPlan": monitor_plan,
        "backgroundSpeechDenoisingPlan": background_speech_denoising_plan,
        "credentialIds": credential_ids
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WorkflowUserEditable
    #
    # @param json_object [String]
    # @return [Vapi::WorkflowUserEditable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      nodes = parsed_json["nodes"]&.map do |item|
        item = item.to_json
        Vapi::WorkflowUserEditableNodesItem.from_json(json_object: item)
      end
      if parsed_json["transcriber"].nil?
        transcriber = nil
      else
        transcriber = parsed_json["transcriber"].to_json
        transcriber = Vapi::WorkflowUserEditableTranscriber.from_json(json_object: transcriber)
      end
      if parsed_json["voice"].nil?
        voice = nil
      else
        voice = parsed_json["voice"].to_json
        voice = Vapi::WorkflowUserEditableVoice.from_json(json_object: voice)
      end
      if parsed_json["observabilityPlan"].nil?
        observability_plan = nil
      else
        observability_plan = parsed_json["observabilityPlan"].to_json
        observability_plan = Vapi::LangfuseObservabilityPlan.from_json(json_object: observability_plan)
      end
      if parsed_json["backgroundSound"].nil?
        background_sound = nil
      else
        background_sound = parsed_json["backgroundSound"].to_json
        background_sound = Vapi::WorkflowUserEditableBackgroundSound.from_json(json_object: background_sound)
      end
      credentials = parsed_json["credentials"]&.map do |item|
        item = item.to_json
        Vapi::WorkflowUserEditableCredentialsItem.from_json(json_object: item)
      end
      name = parsed_json["name"]
      edges = parsed_json["edges"]&.map do |item|
        item = item.to_json
        Vapi::Edge.from_json(json_object: item)
      end
      global_prompt = parsed_json["globalPrompt"]
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      if parsed_json["compliancePlan"].nil?
        compliance_plan = nil
      else
        compliance_plan = parsed_json["compliancePlan"].to_json
        compliance_plan = Vapi::CompliancePlan.from_json(json_object: compliance_plan)
      end
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
      if parsed_json["backgroundSpeechDenoisingPlan"].nil?
        background_speech_denoising_plan = nil
      else
        background_speech_denoising_plan = parsed_json["backgroundSpeechDenoisingPlan"].to_json
        background_speech_denoising_plan = Vapi::BackgroundSpeechDenoisingPlan.from_json(json_object: background_speech_denoising_plan)
      end
      credential_ids = parsed_json["credentialIds"]
      new(
        nodes: nodes,
        transcriber: transcriber,
        voice: voice,
        observability_plan: observability_plan,
        background_sound: background_sound,
        credentials: credentials,
        name: name,
        edges: edges,
        global_prompt: global_prompt,
        server: server,
        compliance_plan: compliance_plan,
        analysis_plan: analysis_plan,
        artifact_plan: artifact_plan,
        start_speaking_plan: start_speaking_plan,
        stop_speaking_plan: stop_speaking_plan,
        monitor_plan: monitor_plan,
        background_speech_denoising_plan: background_speech_denoising_plan,
        credential_ids: credential_ids,
        additional_properties: struct
      )
    end

    # Serialize an instance of WorkflowUserEditable to a JSON object
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
      obj.nodes.is_a?(Array) != false || raise("Passed value for field obj.nodes is not the expected type, validation failed.")
      obj.transcriber.nil? || Vapi::WorkflowUserEditableTranscriber.validate_raw(obj: obj.transcriber)
      obj.voice.nil? || Vapi::WorkflowUserEditableVoice.validate_raw(obj: obj.voice)
      obj.observability_plan.nil? || Vapi::LangfuseObservabilityPlan.validate_raw(obj: obj.observability_plan)
      obj.background_sound.nil? || Vapi::WorkflowUserEditableBackgroundSound.validate_raw(obj: obj.background_sound)
      obj.credentials&.is_a?(Array) != false || raise("Passed value for field obj.credentials is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.edges.is_a?(Array) != false || raise("Passed value for field obj.edges is not the expected type, validation failed.")
      obj.global_prompt&.is_a?(String) != false || raise("Passed value for field obj.global_prompt is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.compliance_plan.nil? || Vapi::CompliancePlan.validate_raw(obj: obj.compliance_plan)
      obj.analysis_plan.nil? || Vapi::AnalysisPlan.validate_raw(obj: obj.analysis_plan)
      obj.artifact_plan.nil? || Vapi::ArtifactPlan.validate_raw(obj: obj.artifact_plan)
      obj.start_speaking_plan.nil? || Vapi::StartSpeakingPlan.validate_raw(obj: obj.start_speaking_plan)
      obj.stop_speaking_plan.nil? || Vapi::StopSpeakingPlan.validate_raw(obj: obj.stop_speaking_plan)
      obj.monitor_plan.nil? || Vapi::MonitorPlan.validate_raw(obj: obj.monitor_plan)
      obj.background_speech_denoising_plan.nil? || Vapi::BackgroundSpeechDenoisingPlan.validate_raw(obj: obj.background_speech_denoising_plan)
      obj.credential_ids&.is_a?(Array) != false || raise("Passed value for field obj.credential_ids is not the expected type, validation failed.")
    end
  end
end
