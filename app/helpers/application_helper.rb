module ApplicationHelper
  def my_name
    "emm305"
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group sas-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

end
