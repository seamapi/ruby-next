# frozen_string_literal: true

module Seam
  class UnmanagedDevice < BaseResource
    attr_accessor :can_program_offline_access_codes, :can_program_online_access_codes, :can_remotely_lock, :can_remotely_unlock, :can_simulate_connection, :can_simulate_disconnection, :can_simulate_removal, :capabilities_supported, :connected_account_id, :device_id, :device_type, :is_managed, :location, :properties, :workspace_id

    date_accessor :created_at

    include Seam::ResourceErrorsSupport
    include Seam::ResourceWarningsSupport
  end
end
