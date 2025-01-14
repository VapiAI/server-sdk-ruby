# frozen_string_literal: true

require "json"
require_relative "create_anthropic_credential_dto"
require_relative "create_anyscale_credential_dto"
require_relative "create_assembly_ai_credential_dto"
require_relative "create_azure_open_ai_credential_dto"
require_relative "create_azure_credential_dto"
require_relative "create_byo_sip_trunk_credential_dto"
require_relative "create_cartesia_credential_dto"
require_relative "create_cloudflare_credential_dto"
require_relative "create_custom_llm_credential_dto"
require_relative "create_deepgram_credential_dto"
require_relative "create_deep_infra_credential_dto"
require_relative "create_deep_seek_credential_dto"
require_relative "create_eleven_labs_credential_dto"
require_relative "create_gcp_credential_dto"
require_relative "create_gladia_credential_dto"
require_relative "create_go_high_level_credential_dto"
require_relative "create_groq_credential_dto"
require_relative "create_langfuse_credential_dto"
require_relative "create_lmnt_credential_dto"
require_relative "create_make_credential_dto"
require_relative "create_open_ai_credential_dto"
require_relative "create_open_router_credential_dto"
require_relative "create_perplexity_ai_credential_dto"
require_relative "create_play_ht_credential_dto"
require_relative "create_rime_ai_credential_dto"
require_relative "create_runpod_credential_dto"
require_relative "create_s_3_credential_dto"
require_relative "create_smallest_ai_credential_dto"
require_relative "create_tavus_credential_dto"
require_relative "create_together_ai_credential_dto"
require_relative "create_twilio_credential_dto"
require_relative "create_vonage_credential_dto"
require_relative "create_webhook_credential_dto"
require_relative "create_x_ai_credential_dto"

module Vapi
  class AssistantCredentialsItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::AssistantCredentialsItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of AssistantCredentialsItem
    #
    # @param json_object [String]
    # @return [Vapi::AssistantCredentialsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "anthropic"
                 Vapi::CreateAnthropicCredentialDto.from_json(json_object: json_object)
               when "anyscale"
                 Vapi::CreateAnyscaleCredentialDto.from_json(json_object: json_object)
               when "assembly-ai"
                 Vapi::CreateAssemblyAiCredentialDto.from_json(json_object: json_object)
               when "azure-openai"
                 Vapi::CreateAzureOpenAiCredentialDto.from_json(json_object: json_object)
               when "azure"
                 Vapi::CreateAzureCredentialDto.from_json(json_object: json_object)
               when "byo-sip-trunk"
                 Vapi::CreateByoSipTrunkCredentialDto.from_json(json_object: json_object)
               when "cartesia"
                 Vapi::CreateCartesiaCredentialDto.from_json(json_object: json_object)
               when "cloudflare"
                 Vapi::CreateCloudflareCredentialDto.from_json(json_object: json_object)
               when "custom-llm"
                 Vapi::CreateCustomLlmCredentialDto.from_json(json_object: json_object)
               when "deepgram"
                 Vapi::CreateDeepgramCredentialDto.from_json(json_object: json_object)
               when "deepinfra"
                 Vapi::CreateDeepInfraCredentialDto.from_json(json_object: json_object)
               when "deep-seek"
                 Vapi::CreateDeepSeekCredentialDto.from_json(json_object: json_object)
               when "11labs"
                 Vapi::CreateElevenLabsCredentialDto.from_json(json_object: json_object)
               when "gcp"
                 Vapi::CreateGcpCredentialDto.from_json(json_object: json_object)
               when "gladia"
                 Vapi::CreateGladiaCredentialDto.from_json(json_object: json_object)
               when "gohighlevel"
                 Vapi::CreateGoHighLevelCredentialDto.from_json(json_object: json_object)
               when "groq"
                 Vapi::CreateGroqCredentialDto.from_json(json_object: json_object)
               when "langfuse"
                 Vapi::CreateLangfuseCredentialDto.from_json(json_object: json_object)
               when "lmnt"
                 Vapi::CreateLmntCredentialDto.from_json(json_object: json_object)
               when "make"
                 Vapi::CreateMakeCredentialDto.from_json(json_object: json_object)
               when "openai"
                 Vapi::CreateOpenAiCredentialDto.from_json(json_object: json_object)
               when "openrouter"
                 Vapi::CreateOpenRouterCredentialDto.from_json(json_object: json_object)
               when "perplexity-ai"
                 Vapi::CreatePerplexityAiCredentialDto.from_json(json_object: json_object)
               when "playht"
                 Vapi::CreatePlayHtCredentialDto.from_json(json_object: json_object)
               when "rime-ai"
                 Vapi::CreateRimeAiCredentialDto.from_json(json_object: json_object)
               when "runpod"
                 Vapi::CreateRunpodCredentialDto.from_json(json_object: json_object)
               when "s3"
                 Vapi::CreateS3CredentialDto.from_json(json_object: json_object)
               when "smallest-ai"
                 Vapi::CreateSmallestAiCredentialDto.from_json(json_object: json_object)
               when "tavus"
                 Vapi::CreateTavusCredentialDto.from_json(json_object: json_object)
               when "together-ai"
                 Vapi::CreateTogetherAiCredentialDto.from_json(json_object: json_object)
               when "twilio"
                 Vapi::CreateTwilioCredentialDto.from_json(json_object: json_object)
               when "vonage"
                 Vapi::CreateVonageCredentialDto.from_json(json_object: json_object)
               when "webhook"
                 Vapi::CreateWebhookCredentialDto.from_json(json_object: json_object)
               when "xai"
                 Vapi::CreateXAiCredentialDto.from_json(json_object: json_object)
               else
                 Vapi::CreateAnthropicCredentialDto.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.provider)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "anthropic"
        { **@member.to_json, provider: @discriminant }.to_json
      when "anyscale"
        { **@member.to_json, provider: @discriminant }.to_json
      when "assembly-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "azure-openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "azure"
        { **@member.to_json, provider: @discriminant }.to_json
      when "byo-sip-trunk"
        { **@member.to_json, provider: @discriminant }.to_json
      when "cartesia"
        { **@member.to_json, provider: @discriminant }.to_json
      when "cloudflare"
        { **@member.to_json, provider: @discriminant }.to_json
      when "custom-llm"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deepgram"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deepinfra"
        { **@member.to_json, provider: @discriminant }.to_json
      when "deep-seek"
        { **@member.to_json, provider: @discriminant }.to_json
      when "11labs"
        { **@member.to_json, provider: @discriminant }.to_json
      when "gcp"
        { **@member.to_json, provider: @discriminant }.to_json
      when "gladia"
        { **@member.to_json, provider: @discriminant }.to_json
      when "gohighlevel"
        { **@member.to_json, provider: @discriminant }.to_json
      when "groq"
        { **@member.to_json, provider: @discriminant }.to_json
      when "langfuse"
        { **@member.to_json, provider: @discriminant }.to_json
      when "lmnt"
        { **@member.to_json, provider: @discriminant }.to_json
      when "make"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "openrouter"
        { **@member.to_json, provider: @discriminant }.to_json
      when "perplexity-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "playht"
        { **@member.to_json, provider: @discriminant }.to_json
      when "rime-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "runpod"
        { **@member.to_json, provider: @discriminant }.to_json
      when "s3"
        { **@member.to_json, provider: @discriminant }.to_json
      when "smallest-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "tavus"
        { **@member.to_json, provider: @discriminant }.to_json
      when "together-ai"
        { **@member.to_json, provider: @discriminant }.to_json
      when "twilio"
        { **@member.to_json, provider: @discriminant }.to_json
      when "vonage"
        { **@member.to_json, provider: @discriminant }.to_json
      when "webhook"
        { **@member.to_json, provider: @discriminant }.to_json
      when "xai"
        { **@member.to_json, provider: @discriminant }.to_json
      else
        { "provider": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.provider
      when "anthropic"
        Vapi::CreateAnthropicCredentialDto.validate_raw(obj: obj)
      when "anyscale"
        Vapi::CreateAnyscaleCredentialDto.validate_raw(obj: obj)
      when "assembly-ai"
        Vapi::CreateAssemblyAiCredentialDto.validate_raw(obj: obj)
      when "azure-openai"
        Vapi::CreateAzureOpenAiCredentialDto.validate_raw(obj: obj)
      when "azure"
        Vapi::CreateAzureCredentialDto.validate_raw(obj: obj)
      when "byo-sip-trunk"
        Vapi::CreateByoSipTrunkCredentialDto.validate_raw(obj: obj)
      when "cartesia"
        Vapi::CreateCartesiaCredentialDto.validate_raw(obj: obj)
      when "cloudflare"
        Vapi::CreateCloudflareCredentialDto.validate_raw(obj: obj)
      when "custom-llm"
        Vapi::CreateCustomLlmCredentialDto.validate_raw(obj: obj)
      when "deepgram"
        Vapi::CreateDeepgramCredentialDto.validate_raw(obj: obj)
      when "deepinfra"
        Vapi::CreateDeepInfraCredentialDto.validate_raw(obj: obj)
      when "deep-seek"
        Vapi::CreateDeepSeekCredentialDto.validate_raw(obj: obj)
      when "11labs"
        Vapi::CreateElevenLabsCredentialDto.validate_raw(obj: obj)
      when "gcp"
        Vapi::CreateGcpCredentialDto.validate_raw(obj: obj)
      when "gladia"
        Vapi::CreateGladiaCredentialDto.validate_raw(obj: obj)
      when "gohighlevel"
        Vapi::CreateGoHighLevelCredentialDto.validate_raw(obj: obj)
      when "groq"
        Vapi::CreateGroqCredentialDto.validate_raw(obj: obj)
      when "langfuse"
        Vapi::CreateLangfuseCredentialDto.validate_raw(obj: obj)
      when "lmnt"
        Vapi::CreateLmntCredentialDto.validate_raw(obj: obj)
      when "make"
        Vapi::CreateMakeCredentialDto.validate_raw(obj: obj)
      when "openai"
        Vapi::CreateOpenAiCredentialDto.validate_raw(obj: obj)
      when "openrouter"
        Vapi::CreateOpenRouterCredentialDto.validate_raw(obj: obj)
      when "perplexity-ai"
        Vapi::CreatePerplexityAiCredentialDto.validate_raw(obj: obj)
      when "playht"
        Vapi::CreatePlayHtCredentialDto.validate_raw(obj: obj)
      when "rime-ai"
        Vapi::CreateRimeAiCredentialDto.validate_raw(obj: obj)
      when "runpod"
        Vapi::CreateRunpodCredentialDto.validate_raw(obj: obj)
      when "s3"
        Vapi::CreateS3CredentialDto.validate_raw(obj: obj)
      when "smallest-ai"
        Vapi::CreateSmallestAiCredentialDto.validate_raw(obj: obj)
      when "tavus"
        Vapi::CreateTavusCredentialDto.validate_raw(obj: obj)
      when "together-ai"
        Vapi::CreateTogetherAiCredentialDto.validate_raw(obj: obj)
      when "twilio"
        Vapi::CreateTwilioCredentialDto.validate_raw(obj: obj)
      when "vonage"
        Vapi::CreateVonageCredentialDto.validate_raw(obj: obj)
      when "webhook"
        Vapi::CreateWebhookCredentialDto.validate_raw(obj: obj)
      when "xai"
        Vapi::CreateXAiCredentialDto.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [Vapi::CreateAnthropicCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.anthropic(member:)
      new(member: member, discriminant: "anthropic")
    end

    # @param member [Vapi::CreateAnyscaleCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.anyscale(member:)
      new(member: member, discriminant: "anyscale")
    end

    # @param member [Vapi::CreateAssemblyAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.assembly_ai(member:)
      new(member: member, discriminant: "assembly-ai")
    end

    # @param member [Vapi::CreateAzureOpenAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.azure_openai(member:)
      new(member: member, discriminant: "azure-openai")
    end

    # @param member [Vapi::CreateAzureCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.azure(member:)
      new(member: member, discriminant: "azure")
    end

    # @param member [Vapi::CreateByoSipTrunkCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.byo_sip_trunk(member:)
      new(member: member, discriminant: "byo-sip-trunk")
    end

    # @param member [Vapi::CreateCartesiaCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.cartesia(member:)
      new(member: member, discriminant: "cartesia")
    end

    # @param member [Vapi::CreateCloudflareCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.cloudflare(member:)
      new(member: member, discriminant: "cloudflare")
    end

    # @param member [Vapi::CreateCustomLlmCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.custom_llm(member:)
      new(member: member, discriminant: "custom-llm")
    end

    # @param member [Vapi::CreateDeepgramCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.deepgram(member:)
      new(member: member, discriminant: "deepgram")
    end

    # @param member [Vapi::CreateDeepInfraCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.deepinfra(member:)
      new(member: member, discriminant: "deepinfra")
    end

    # @param member [Vapi::CreateDeepSeekCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.deep_seek(member:)
      new(member: member, discriminant: "deep-seek")
    end

    # @param member [Vapi::CreateElevenLabsCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self._11_labs(member:)
      new(member: member, discriminant: "11labs")
    end

    # @param member [Vapi::CreateGcpCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.gcp(member:)
      new(member: member, discriminant: "gcp")
    end

    # @param member [Vapi::CreateGladiaCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.gladia(member:)
      new(member: member, discriminant: "gladia")
    end

    # @param member [Vapi::CreateGoHighLevelCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.gohighlevel(member:)
      new(member: member, discriminant: "gohighlevel")
    end

    # @param member [Vapi::CreateGroqCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.groq(member:)
      new(member: member, discriminant: "groq")
    end

    # @param member [Vapi::CreateLangfuseCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.langfuse(member:)
      new(member: member, discriminant: "langfuse")
    end

    # @param member [Vapi::CreateLmntCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.lmnt(member:)
      new(member: member, discriminant: "lmnt")
    end

    # @param member [Vapi::CreateMakeCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.make(member:)
      new(member: member, discriminant: "make")
    end

    # @param member [Vapi::CreateOpenAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.openai(member:)
      new(member: member, discriminant: "openai")
    end

    # @param member [Vapi::CreateOpenRouterCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.openrouter(member:)
      new(member: member, discriminant: "openrouter")
    end

    # @param member [Vapi::CreatePerplexityAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.perplexity_ai(member:)
      new(member: member, discriminant: "perplexity-ai")
    end

    # @param member [Vapi::CreatePlayHtCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.playht(member:)
      new(member: member, discriminant: "playht")
    end

    # @param member [Vapi::CreateRimeAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.rime_ai(member:)
      new(member: member, discriminant: "rime-ai")
    end

    # @param member [Vapi::CreateRunpodCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.runpod(member:)
      new(member: member, discriminant: "runpod")
    end

    # @param member [Vapi::CreateS3CredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.s_3(member:)
      new(member: member, discriminant: "s3")
    end

    # @param member [Vapi::CreateSmallestAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.smallest_ai(member:)
      new(member: member, discriminant: "smallest-ai")
    end

    # @param member [Vapi::CreateTavusCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.tavus(member:)
      new(member: member, discriminant: "tavus")
    end

    # @param member [Vapi::CreateTogetherAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.together_ai(member:)
      new(member: member, discriminant: "together-ai")
    end

    # @param member [Vapi::CreateTwilioCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.twilio(member:)
      new(member: member, discriminant: "twilio")
    end

    # @param member [Vapi::CreateVonageCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.vonage(member:)
      new(member: member, discriminant: "vonage")
    end

    # @param member [Vapi::CreateWebhookCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.webhook(member:)
      new(member: member, discriminant: "webhook")
    end

    # @param member [Vapi::CreateXAiCredentialDto]
    # @return [Vapi::AssistantCredentialsItem]
    def self.xai(member:)
      new(member: member, discriminant: "xai")
    end
  end
end
