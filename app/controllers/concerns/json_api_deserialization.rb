require 'active_support/concern'

# Deserialization
module JsonApiDeserialization
  extend ActiveSupport::Concern

  protected

  def jsonapi_parsed_params(root_key)
    ActionController::Parameters.new(root_key.to_s => ActiveModelSerializers::Deserialization.jsonapi_parse!(params))
  end
end
