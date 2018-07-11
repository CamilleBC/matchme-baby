class PicturePreviewInput < SimpleForm::Inputs::FileInput
  def input(_wrapper_options = nil)
    # :preview_version is a custom attribute from :input_html hash,
    # so you can pick custom sizes
    version = input_html_options.delete(:preview_version)
    out = ActiveSupport::SafeBuffer.new # the output buffer we're going to build
    # check if there's an uploaded file (eg: edit mode or form not saved)
    if object.send("#{attribute_name}?")
      # append preview image to output
      out << template.image_tag(object.send(attribute_name).tap do |o|
        break o.send(version) if version
      end.send('url'))
    end
    # allow multiple submissions without losing the tmp version
    out << @builder.hidden_field("#{attribute_name}_cache").html_safe.dup
    # append file input. it will work accordingly with your simple_form wrappers
    out << @builder.file_field(attribute_name, input_html_options)
  end

  # def input(wrapper_options = nil)
  #   merged_input_options = merge_wrapper_options(
  #     input_html_options,
  #     wrapper_options
  #   )

  #   url = preview_url(merged_input_options)

  #   out = ''
  #   out << template.image_tag(url) if url
  #   out << @builder.input("#{attribute_name}_cache", as: 'hidden')
  #   (out << super).html_safe
  # end

  # private

  # def preview_url(merged_input_options)
  #   use_default_url = options.delete(:use_default_url) || false
  #   version = merged_input_options.delete(:preview_version)

  #   if merged_input_options[:preview_url]
  #     merged_input_options[:preview_url]
  #   elsif object&.send("#{attribute_name}?") || use_default_url
  #     object.send(attribute_name).tap { |o| break o.send(version) if version }.send('url')
  #   end
  # end
end
