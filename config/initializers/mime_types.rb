# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register "application/pdf", :pdf

Mime::Type.register "api/v1", :jsonapi
ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::JSONAPI] = -> body { JSON.parse body
}