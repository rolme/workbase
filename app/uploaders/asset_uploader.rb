class AssetUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :save_info

  version :thumb, if: :image? do
    process :store_dimensions
    process :resize_to_fit => [150, 150]

    def store_dimensions
      if file && model
        model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions]
      end
    end
  end

  version :still, if: :video? do
    process thumbnail: [{format: 'png', quality: 10, size: 150, strip: true, logger: Rails.logger}]

    def full_filename for_file
      %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
    end
  end

  def save_info
    if file.content_type
      model.content_type   = file.content_type.gsub("application", "video") if (/application/ === file.content_type)
      model.content_type ||= file.content_type
    end

    model.file_size = file.size
  end

protected

  def image?(new_file)
    /^image/ === new_file.content_type
  end

  def video?(new_file)
    /mov|mp4$/ === new_file.content_type
  end

end
