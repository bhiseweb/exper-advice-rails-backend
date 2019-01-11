require 'active_support/concern'

# Comment params
module CommentParams
  include BaseParams

  UPDATE_PARAMS = %i[
    description
  ].freeze

  CREATE_PARAMS = (UPDATE_PARAMS + %i[user_id post_id]).freeze
  MODEL_NAME = :comment
end
