require 'active_support/concern'

# Post params
module PostParams
  include BaseParams

  UPDATE_PARAMS = %i[
    title
    body
    slug
  ].freeze

  CREATE_PARAMS = (UPDATE_PARAMS + [:user_id]).freeze
  MODEL_NAME = :post

  def post_params
    create_params.merge(account_id: current_account.id)
  end
end
