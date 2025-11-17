# frozen_string_literal: true

require_relative "create_workflow_dto_nodes_item"
require_relative "create_workflow_dto_model"
require_relative "create_workflow_dto_transcriber"
require_relative "create_workflow_dto_voice"
require_relative "langfuse_observability_plan"
require_relative "create_workflow_dto_background_sound"
require_relative "create_workflow_dto_hooks_item"
require_relative "create_workflow_dto_credentials_item"
require_relative "create_workflow_dto_voicemail_detection"
require_relative "edge"
require_relative "server"
require_relative "compliance_plan"
require_relative "analysis_plan"
require_relative "artifact_plan"
require_relative "start_speaking_plan"
require_relative "stop_speaking_plan"
require_relative "monitor_plan"
require_relative "background_speech_denoising_plan"
require_relative "keypad_input_plan"
require "ostruct"
require "json"

module Vapi
  class CreateWorkflowDto
    # @return [Array<Vapi::CreateWorkflowDtoNodesItem>]
    attr_reader :nodes
    # @return [Vapi::CreateWorkflowDtoModel] This is the model for the workflow.
    #  This can be overridden at node level using `nodes[n].model`.
    attr_reader :model
    # @return [Vapi::CreateWorkflowDtoTranscriber] This is the transcriber for the workflow.
    #  This can be overridden at node level using `nodes[n].transcriber`.
    attr_reader :transcriber
    # @return [Vapi::CreateWorkflowDtoVoice] This is the voice for the workflow.
    #  This can be overridden at node level using `nodes[n].voice`.
    attr_reader :voice
    # @return [Vapi::LangfuseObservabilityPlan] This is the plan for observability of workflow's calls.
    #  Currently, only Langfuse is supported.
    attr_reader :observability_plan
    # @return [Vapi::CreateWorkflowDtoBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    #  You can also provide a custom sound by providing a URL to an audio file.
    attr_reader :background_sound
    # @return [Array<Vapi::CreateWorkflowDtoHooksItem>] This is a set of actions that will be performed on certain events.
    attr_reader :hooks
    # @return [Array<Vapi::CreateWorkflowDtoCredentialsItem>] These are dynamic credentials that will be used for the workflow calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.
    attr_reader :credentials
    # @return [Vapi::CreateWorkflowDtoVoicemailDetection] This is the voicemail detection plan for the workflow.
    attr_reader :voicemail_detection
    # @return [Float] This is the maximum duration of the call in seconds.
    #  After this duration, the call will automatically end.
    #  Default is 1800 (30 minutes), max is 43200 (12 hours), and min is 10 seconds.
    attr_reader :max_duration_seconds
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
    # @return [Vapi::KeypadInputPlan] This is the plan for keypad input handling during workflow calls.
    attr_reader :keypad_input_plan
    # @return [String] This is the message that the assistant will say if the call is forwarded to
    #  voicemail.
    #  If unspecified, it will hang up.
    attr_reader :voicemail_message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param nodes [Array<Vapi::CreateWorkflowDtoNodesItem>]
    # @param model [Vapi::CreateWorkflowDtoModel] This is the model for the workflow.
    #  This can be overridden at node level using `nodes[n].model`.
    # @param transcriber [Vapi::CreateWorkflowDtoTranscriber] This is the transcriber for the workflow.
    #  This can be overridden at node level using `nodes[n].transcriber`.
    # @param voice [Vapi::CreateWorkflowDtoVoice] This is the voice for the workflow.
    #  This can be overridden at node level using `nodes[n].voice`.
    # @param observability_plan [Vapi::LangfuseObservabilityPlan] This is the plan for observability of workflow's calls.
    #  Currently, only Langfuse is supported.
    # @param background_sound [Vapi::CreateWorkflowDtoBackgroundSound] This is the background sound in the call. Default for phone calls is 'office'
    #  and default for web calls is 'off'.
    #  You can also provide a custom sound by providing a URL to an audio file.
    # @param hooks [Array<Vapi::CreateWorkflowDtoHooksItem>] This is a set of actions that will be performed on certain events.
    # @param credentials [Array<Vapi::CreateWorkflowDtoCredentialsItem>] These are dynamic credentials that will be used for the workflow calls. By
    #  default, all the credentials are available for use in the call but you can
    #  supplement an additional credentials using this. Dynamic credentials override
    #  existing credentials.
    # @param voicemail_detection [Vapi::CreateWorkflowDtoVoicemailDetection] This is the voicemail detection plan for the workflow.
    # @param max_duration_seconds [Float] This is the maximum duration of the call in seconds.
    #  After this duration, the call will automatically end.
    #  Default is 1800 (30 minutes), max is 43200 (12 hours), and min is 10 seconds.
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
    # @param keypad_input_plan [Vapi::KeypadInputPlan] This is the plan for keypad input handling during workflow calls.
    # @param voicemail_message [String] This is the message that the assistant will say if the call is forwarded to
    #  voicemail.
    #  If unspecified, it will hang up.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWorkflowDto]
    def initialize(nodes:, name:, edges:, model: OMIT, transcriber: OMIT, voice: OMIT, observability_plan: OMIT,
                   background_sound: OMIT, hooks: OMIT, credentials: OMIT, voicemail_detection: OMIT, max_duration_seconds: OMIT, global_prompt: OMIT, server: OMIT, compliance_plan: OMIT, analysis_plan: OMIT, artifact_plan: OMIT, start_speaking_plan: OMIT, stop_speaking_plan: OMIT, monitor_plan: OMIT, background_speech_denoising_plan: OMIT, credential_ids: OMIT, keypad_input_plan: OMIT, voicemail_message: OMIT, additional_properties: nil)
      @nodes = nodes
      @model = model if model != OMIT
      @transcriber = transcriber if transcriber != OMIT
      @voice = voice if voice != OMIT
      @observability_plan = observability_plan if observability_plan != OMIT
      @background_sound = background_sound if background_sound != OMIT
      @hooks = hooks if hooks != OMIT
      @credentials = credentials if credentials != OMIT
      @voicemail_detection = voicemail_detection if voicemail_detection != OMIT
      @max_duration_seconds = max_duration_seconds if max_duration_seconds != OMIT
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
      @keypad_input_plan = keypad_input_plan if keypad_input_plan != OMIT
      @voicemail_message = voicemail_message if voicemail_message != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "nodes": nodes,
        "model": model,
        "transcriber": transcriber,
        "voice": voice,
        "observabilityPlan": observability_plan,
        "backgroundSound": background_sound,
        "hooks": hooks,
        "credentials": credentials,
        "voicemailDetection": voicemail_detection,
        "maxDurationSeconds": max_duration_seconds,
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
        "credentialIds": credential_ids,
        "keypadInputPlan": keypad_input_plan,
        "voicemailMessage": voicemail_message
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateWorkflowDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateWorkflowDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      nodes = parsed_json["nodes"]&.map do |item|
        item = item.to_json
        Vapi::CreateWorkflowDtoNodesItem.from_json(json_object: item)
      end
      if parsed_json["model"].nil?
        model = nil
      else
        model = parsed_json["model"].to_json
        model = Vapi::CreateWorkflowDtoModel.from_json(json_object: model)
      end
      if parsed_json["transcriber"].nil?
        transcriber = nil
      else
        transcriber = parsed_json["transcriber"].to_json
        transcriber = Vapi::CreateWorkflowDtoTranscriber.from_json(json_object: transcriber)
      end
      if parsed_json["voice"].nil?
        voice = nil
      else
        voice = parsed_json["voice"].to_json
        voice = Vapi::CreateWorkflowDtoVoice.from_json(json_object: voice)
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
        background_sound = Vapi::CreateWorkflowDtoBackgroundSound.from_json(json_object: background_sound)
      end
      hooks = parsed_json["hooks"]&.map do |item|
        item = item.to_json
        Vapi::CreateWorkflowDtoHooksItem.from_json(json_object: item)
      end
      credentials = parsed_json["credentials"]&.map do |item|
        item = item.to_json
        Vapi::CreateWorkflowDtoCredentialsItem.from_json(json_object: item)
      end
      if parsed_json["voicemailDetection"].nil?
        voicemail_detection = nil
      else
        voicemail_detection = parsed_json["voicemailDetection"].to_json
        voicemail_detection = Vapi::CreateWorkflowDtoVoicemailDetection.from_json(json_object: voicemail_detection)
      end
      max_duration_seconds = parsed_json["maxDurationSeconds"]
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
      if parsed_json["keypadInputPlan"].nil?
        keypad_input_plan = nil
      else
        keypad_input_plan = parsed_json["keypadInputPlan"].to_json
        keypad_input_plan = Vapi::KeypadInputPlan.from_json(json_object: keypad_input_plan)
      end
      voicemail_message = parsed_json["voicemailMessage"]
      new(
        nodes: nodes,
        model: model,
        transcriber: transcriber,
        voice: voice,
        observability_plan: observability_plan,
        background_sound: background_sound,
        hooks: hooks,
        credentials: credentials,
        voicemail_detection: voicemail_detection,
        max_duration_seconds: max_duration_seconds,
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
        keypad_input_plan: keypad_input_plan,
        voicemail_message: voicemail_message,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateWorkflowDto to a JSON object
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
      obj.model.nil? || Vapi::CreateWorkflowDtoModel.validate_raw(obj: obj.model)
      obj.transcriber.nil? || Vapi::CreateWorkflowDtoTranscriber.validate_raw(obj: obj.transcriber)
      obj.voice.nil? || Vapi::CreateWorkflowDtoVoice.validate_raw(obj: obj.voice)
      obj.observability_plan.nil? || Vapi::LangfuseObservabilityPlan.validate_raw(obj: obj.observability_plan)
      obj.background_sound.nil? || Vapi::CreateWorkflowDtoBackgroundSound.validate_raw(obj: obj.background_sound)
      obj.hooks&.is_a?(Array) != false || raise("Passed value for field obj.hooks is not the expected type, validation failed.")
      obj.credentials&.is_a?(Array) != false || raise("Passed value for field obj.credentials is not the expected type, validation failed.")
      obj.voicemail_detection.nil? || Vapi::CreateWorkflowDtoVoicemailDetection.validate_raw(obj: obj.voicemail_detection)
      obj.max_duration_seconds&.is_a?(Float) != false || raise("Passed value for field obj.max_duration_seconds is not the expected type, validation failed.")
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
      obj.keypad_input_plan.nil? || Vapi::KeypadInputPlan.validate_raw(obj: obj.keypad_input_plan)
      obj.voicemail_message&.is_a?(String) != false || raise("Passed value for field obj.voicemail_message is not the expected type, validation failed.")
    end
  end
end
