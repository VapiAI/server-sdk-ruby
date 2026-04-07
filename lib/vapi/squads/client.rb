# frozen_string_literal: true

module Vapi
  module Squads
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
      # @return [Array[Vapi::Types::Squad]]
      def list(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
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
          path: "squad",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # @param request_options [Hash]
      # @param params [Vapi::Types::CreateSquadDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::Squad]
      def create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "squad",
          body: Vapi::Types::CreateSquadDto.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Squad.load(response.body)
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
      # @return [Vapi::Types::Squad]
      def get(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "squad/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Squad.load(response.body)
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
      # @return [Vapi::Types::Squad]
      def delete(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "squad/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Squad.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Squads::Types::UpdateSquadDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::Squad]
      def update(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::Squads::Types::UpdateSquadDto.new(params).to_h
        non_body_param_names = ["id"]
        body = request_data.except(*non_body_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "squad/#{URI.encode_uri_component(params[:id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Squad.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
