# frozen_string_literal: true

module Vapi
  module Chats
    class Client
      # @param client [Vapi::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :id
      # @option params [String, nil] :assistant_id
      # @option params [String, nil] :assistant_id_any
      # @option params [String, nil] :squad_id
      # @option params [String, nil] :session_id
      # @option params [String, nil] :previous_chat_id
      # @option params [Integer, nil] :page
      # @option params [Vapi::Chats::Types::ListChatsRequestSortOrder, nil] :sort_order
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :created_at_gt
      # @option params [String, nil] :created_at_lt
      # @option params [String, nil] :created_at_ge
      # @option params [String, nil] :created_at_le
      # @option params [String, nil] :updated_at_gt
      # @option params [String, nil] :updated_at_lt
      # @option params [String, nil] :updated_at_ge
      # @option params [String, nil] :updated_at_le
      #
      # @return [Vapi::Types::ChatPaginatedResponse]
      def list(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[id assistant_id assistant_id_any squad_id session_id previous_chat_id page sort_order limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)
        query_params["assistantId"] = params[:assistant_id] if params.key?(:assistant_id)
        query_params["assistantIdAny"] = params[:assistant_id_any] if params.key?(:assistant_id_any)
        query_params["squadId"] = params[:squad_id] if params.key?(:squad_id)
        query_params["sessionId"] = params[:session_id] if params.key?(:session_id)
        query_params["previousChatId"] = params[:previous_chat_id] if params.key?(:previous_chat_id)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["sortOrder"] = params[:sort_order] if params.key?(:sort_order)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["createdAtGt"] = params[:created_at_gt] if params.key?(:created_at_gt)
        query_params["createdAtLt"] = params[:created_at_lt] if params.key?(:created_at_lt)
        query_params["createdAtGe"] = params[:created_at_ge] if params.key?(:created_at_ge)
        query_params["createdAtLe"] = params[:created_at_le] if params.key?(:created_at_le)
        query_params["updatedAtGt"] = params[:updated_at_gt] if params.key?(:updated_at_gt)
        query_params["updatedAtLt"] = params[:updated_at_lt] if params.key?(:updated_at_lt)
        query_params["updatedAtGe"] = params[:updated_at_ge] if params.key?(:updated_at_ge)
        query_params["updatedAtLe"] = params[:updated_at_le] if params.key?(:updated_at_le)
        params.except(*query_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "chat",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::ChatPaginatedResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new chat with optional SMS delivery via transport field. Requires at least one of:
      # assistantId/assistant, sessionId, or previousChatId. Note: sessionId and previousChatId are mutually exclusive.
      # Transport field enables SMS delivery with two modes: (1) New conversation - provide transport.phoneNumberId and
      # transport.customer to create a new session, (2) Existing conversation - provide sessionId to use existing
      # session data. Cannot specify both sessionId and transport fields together. The
      # transport.useLLMGeneratedMessageForOutbound flag controls whether input is processed by LLM (true, default) or
      # forwarded directly as SMS (false).
      #
      # @param request_options [Hash]
      # @param params [Vapi::Chats::Types::CreateChatDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Chats::Types::CreateChatsResponse]
      def create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "chat",
          body: Vapi::Chats::Types::CreateChatDto.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Chats::Types::CreateChatsResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::Chat]
      def get(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "chat/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Chat.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::Chat]
      def delete(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "chat/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Chat.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Chats::Types::OpenAiResponsesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Chats::Types::CreateResponseChatsResponse]
      def create_response(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "chat/responses",
          body: Vapi::Chats::Types::OpenAiResponsesRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Chats::Types::CreateResponseChatsResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
