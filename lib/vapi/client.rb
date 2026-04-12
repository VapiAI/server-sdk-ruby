# frozen_string_literal: true

module Vapi
  class Client
    # @param base_url [String, nil]
    # @param token [String]
    #
    # @return [void]
    def initialize(token:, base_url: nil)
      @raw_client = Vapi::Internal::Http::RawClient.new(
        base_url: base_url || Vapi::Environment::DEFAULT,
        headers: {
          "User-Agent" => "vapi_server_sdk/1.0.0",
          "X-Fern-Language" => "Ruby",
          Authorization: "Bearer #{token}"
        }
      )
    end

    # @return [Vapi::Assistants::Client]
    def assistants
      @assistants ||= Vapi::Assistants::Client.new(client: @raw_client)
    end

    # @return [Vapi::Squads::Client]
    def squads
      @squads ||= Vapi::Squads::Client.new(client: @raw_client)
    end

    # @return [Vapi::Calls::Client]
    def calls
      @calls ||= Vapi::Calls::Client.new(client: @raw_client)
    end

    # @return [Vapi::Chats::Client]
    def chats
      @chats ||= Vapi::Chats::Client.new(client: @raw_client)
    end

    # @return [Vapi::Campaigns::Client]
    def campaigns
      @campaigns ||= Vapi::Campaigns::Client.new(client: @raw_client)
    end

    # @return [Vapi::Sessions::Client]
    def sessions
      @sessions ||= Vapi::Sessions::Client.new(client: @raw_client)
    end

    # @return [Vapi::PhoneNumbers::Client]
    def phone_numbers
      @phone_numbers ||= Vapi::PhoneNumbers::Client.new(client: @raw_client)
    end

    # @return [Vapi::Tools::Client]
    def tools
      @tools ||= Vapi::Tools::Client.new(client: @raw_client)
    end

    # @return [Vapi::Files::Client]
    def files
      @files ||= Vapi::Files::Client.new(client: @raw_client)
    end

    # @return [Vapi::StructuredOutputs::Client]
    def structured_outputs
      @structured_outputs ||= Vapi::StructuredOutputs::Client.new(client: @raw_client)
    end

    # @return [Vapi::Insight::Client]
    def insight
      @insight ||= Vapi::Insight::Client.new(client: @raw_client)
    end

    # @return [Vapi::Eval::Client]
    def eval
      @eval ||= Vapi::Eval::Client.new(client: @raw_client)
    end

    # @return [Vapi::ObservabilityScorecard::Client]
    def observability_scorecard
      @observability_scorecard ||= Vapi::ObservabilityScorecard::Client.new(client: @raw_client)
    end

    # @return [Vapi::ProviderResources::Client]
    def provider_resources
      @provider_resources ||= Vapi::ProviderResources::Client.new(client: @raw_client)
    end

    # @return [Vapi::Analytics::Client]
    def analytics
      @analytics ||= Vapi::Analytics::Client.new(client: @raw_client)
    end
  end
end
