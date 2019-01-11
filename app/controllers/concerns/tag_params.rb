require 'active_support/concern'

# Tag params
module TagParams
  include BaseParams

  UPDATE_PARAMS = %i[
    name
  ].freeze

  CREATE_PARAMS = (UPDATE_PARAMS + %i[user_id post_id]).freeze
  MODEL_NAME = :comment
end
