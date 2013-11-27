module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def get_localized_path(lang)
    current_path = request.fullpath

    ["en", "ch", "ja"].each do |g|
      current_path.gsub! "/#{g}", ""
    end

    if current_path == "/" || current_path.blank?
      "/#{lang}"
    else
      "/#{lang}#{current_path}"
    end
  end

end
