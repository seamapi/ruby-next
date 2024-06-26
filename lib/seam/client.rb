# frozen_string_literal: true

require_relative "parse_options"

module Seam
  class Client
    attr_accessor :wait_for_action_attempt, :defaults

    def initialize(api_key: nil, personal_access_token: nil, workspace_id: nil, endpoint: nil,
      wait_for_action_attempt: false, debug: false)
      options = SeamOptions.parse_options(api_key: api_key, personal_access_token: personal_access_token, workspace_id: workspace_id, endpoint: endpoint)
      @endpoint = options[:endpoint]
      @auth_headers = options[:auth_headers]
      @debug = debug
      @wait_for_action_attempt = wait_for_action_attempt
      @defaults = {"wait_for_action_attempt" => wait_for_action_attempt}
    end

    def self.from_api_key(api_key, endpoint: nil, wait_for_action_attempt: false, debug: false)
      new(api_key: api_key, endpoint: endpoint, wait_for_action_attempt: wait_for_action_attempt, debug: debug)
    end

    def self.from_personal_access_token(personal_access_token, workspace_id, endpoint: nil, wait_for_action_attempt: false, debug: false)
      new(personal_access_token: personal_access_token, workspace_id: workspace_id, endpoint: endpoint, wait_for_action_attempt: wait_for_action_attempt, debug: debug)
    end

    def self.lts_version
      Seam::LTS_VERSION
    end

    def lts_version
      Seam::LTS_VERSION
    end

    def access_codes
      @access_codes ||= Seam::Clients::AccessCodes.new(self)
    end

    def acs
      @acs ||= Seam::Clients::Acs.new(self)
    end

    def action_attempts
      @action_attempts ||= Seam::Clients::ActionAttempts.new(self)
    end

    def client_sessions
      @client_sessions ||= Seam::Clients::ClientSessions.new(self)
    end

    def connect_webviews
      @connect_webviews ||= Seam::Clients::ConnectWebviews.new(self)
    end

    def connected_accounts
      @connected_accounts ||= Seam::Clients::ConnectedAccounts.new(self)
    end

    def devices
      @devices ||= Seam::Clients::Devices.new(self)
    end

    def events
      @events ||= Seam::Clients::Events.new(self)
    end

    def locks
      @locks ||= Seam::Clients::Locks.new(self)
    end

    def networks
      @networks ||= Seam::Clients::Networks.new(self)
    end

    def noise_sensors
      @noise_sensors ||= Seam::Clients::NoiseSensors.new(self)
    end

    def phones
      @phones ||= Seam::Clients::Phones.new(self)
    end

    def thermostats
      @thermostats ||= Seam::Clients::Thermostats.new(self)
    end

    def user_identities
      @user_identities ||= Seam::Clients::UserIdentities.new(self)
    end

    def webhooks
      @webhooks ||= Seam::Clients::Webhooks.new(self)
    end

    def workspaces
      @workspaces ||= Seam::Clients::Workspaces.new(self)
    end

    def health
      request_seam(:get, "/health")
    end

    # @deprecated Please use {#devices.unmanaged} instead.
    def unmanaged_devices
      warn "[DEPRECATION] 'unmanaged_devices' is deprecated. Please use 'devices.unmanaged' instead."

      @unmanaged_devices ||= Seam::Clients::DevicesUnmanaged.new(self)
    end

    # @deprecated Please use {#access_codes.unmanaged} instead.
    def unmanaged_access_codes
      warn "[DEPRECATION] 'unmanaged_access_codes' is deprecated. Please use 'access_codes.unmanaged' instead."

      @unmanaged_access_codes ||= Seam::Clients::AccessCodesUnmanaged.new(self)
    end

    def request_seam_object(method, path, klass, inner_object, config = {})
      response = request_seam(method, path, config)

      data = response[inner_object]

      klass.load_from_response(data, self)
    end

    def request_seam(method, path, config = {})
      Seam::Request.new(
        auth_headers: @auth_headers,
        endpoint: @endpoint,
        debug: @debug
      ).perform(
        method, path, config
      )
    end
  end
end
