class InstagramApiClient
  include HTTParty

  def initialize
    @base_url = 'https://instagram.com/'
  end

  def method_missing(method, *args, &block)
    return super unless self.class.respond_to?(method)
    self.class.send(method, *args, &block)
  end

  def get_media(username:)
    response = get(@base_url + username + '/media')
    raise InstagramError::UserNotFound.new("Cannot find user: #{username}") unless response.code == 200

    response
  end
end