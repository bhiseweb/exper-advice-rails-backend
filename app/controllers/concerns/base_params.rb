# Base params module
module BaseParams
  include JsonApiDeserialization

  def update_params
    @update_params ||= params_for(self.class.const_get(:UPDATE_PARAMS))
  end

  def create_params
    @create_params ||= params_for(self.class.const_get(:CREATE_PARAMS))
  end

  private

  def params_for(keys)
    jsonapi_parsed_params(model_name)
      .require(model_name)
      .permit(keys)
  end

  def model_name
    self.class.const_get(:MODEL_NAME)
  end
end
