module ApplicationHelper
  # Custom user error messages
  def error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved', count: resource.errors.count, resource: resource.class.model_name.human.downcase)
    html = <<-HTML
    <div id="error_explanation" class="alert alert-danger alert-dismissable">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <strong>#{sentence}</strong>
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end
end