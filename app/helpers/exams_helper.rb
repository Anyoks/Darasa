module ExamsHelper

	  include ActionView::Helpers::SanitizeHelper

	  def foo
	    sanitized_output = sanitize(html_input)
	  end
end
