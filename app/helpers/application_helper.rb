module ApplicationHelper
    # ... other helpers ...

  # Format a label element for a form field.
  # 
  # +options+ can include:
  # 
  # [:required] If +true+, an asterisk is added to the label.
  # [:field_name] If true, the for attribute on the label 
  #               is set from +model+ + +field_name+; 
  #               otherwise, for attribute is set from 
  #               +model+ + lowercased and underscored +label_text+.
  # 
  # Example call:
  #   label(:person, 'Email')
  # 
  # Example output:
  #   <strong><label for="person_email">Email</label>:</strong>
  # def label(model, label_text, options={})
  #   # Use the field_name option if supplied
  #   field_name = options[:field_name]
  #   field_name ||= label_text.gsub(' ', '_')

  #   # The value for the for attribute.
  #   label_for = (model.to_s + '_' + field_name).downcase
  #   # The <label> tag
  #   label_tag = content_tag('label', label_text, :for => label_for)
  #   # Add an asterisk if :required option specified.
  #   label_tag += '*' if options[:required]
  #   # Finish off the label.
  #   label_tag += ':'

  #   # Wrap the <label> tag in a <strong> tag.
  #   content_tag('strong', label_tag)
  # end
  def actions_in_row(obj, path)
    array = []
    content_tag :div do
      array << link_to("#{path}/#{(obj.id)}", class: "btn btn-info btn-link btn-sm"){ |f| content_tag(:i, 'preview', class: 'material-icons')}
      array << link_to("#{path}/#{(obj.id)}/edit", class: "btn btn-success btn-link btn-sm"){ |f| content_tag(:i, 'edit', class: 'material-icons')}
      array << link_to("#{path}/#{(obj.id)}", method: :delete, data: { confirm: 'Are you sure?' } , class: "btn btn-danger btn-link btn-sm") { |f| content_tag(:i, 'close', class: 'material-icons')}
    end
    return array.join
  end
end
