# make attachment_field behave like a normal input type so we get nice wrapper and labels
# <%= f.input :cover_image, as: :attachment, direct: true, presigned: true %>

class AttachmentInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = nil)
    refile_options = [:presigned, :direct, :multiple]
    merged_input_options = merge_wrapper_options(input_options.slice(*refile_options).merge(input_html_options), wrapper_options)
    @builder.attachment_field(attribute_name, merged_input_options)
  end
end
