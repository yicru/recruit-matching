module ApplicationError
  class AuthorizationError < GraphQL::ExecutionError
    def initialize(message = 'Authorization Required', ast_node: nil, options: nil, extensions: nil)
      @ast_node = ast_node
      @options = options
      @extensions = extensions
      super(message)
    end
  end
end
