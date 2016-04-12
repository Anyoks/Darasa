# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register "application/pdf", :pdf

Mime::Type.register "api/v1", :jsonapi
ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::JSONAPI] = -> body { JSON.parse body
}

# Mime::Type.register "text/html", :html

# config/initializers/mime_types.rb

#decompress compressed Json requests

Mime::Type.register "gizp/json", :gzipjson
ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::Type.lookup('gzip/json')]=lambda do |raw_body|
  body = ActiveSupport::Gzip.decompress(raw_body)
  JSON.parse(body).with_indifferent_access
end