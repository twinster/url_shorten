class UrlsService
  attr_accessor :params, :errors

  def initialize(params)
    @params = params
    @errors = []
  end

  def shorten
    split_url
    generate_short_form
    save_url
  end

  def original_url
    split_url
    find_url
  end

  def shorten_json
    { shorten_url: @url.domain + '/' + @url.shorten }
  end

  def original_json
    { original_url: @url.domain + '/' + @url.url }
  end

  private
  def split_url
    @url = URI(@params[:url])
  end

  def generate_short_form
    @slug = SecureRandom.hex(10)
  end

  def save_url
    @url = Url.create!(domain: @url.to_s.gsub(@url.path, ''), url: @url.path, shorten: @slug)
    handle_error
  end

  def find_url
    @url = Url.where(shorten: @url.path.tr('/', '')).first
    @errors << 'not found' unless @url.present?
  end

  def handle_error
    @errors << @url.errors.full_messages if @url.errors.any?
  end
end