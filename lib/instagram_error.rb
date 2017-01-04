module InstagramError
  class UserNotFound < StandardError
    def initialize(message = 'Cannot find user')
      super
    end
  end
end