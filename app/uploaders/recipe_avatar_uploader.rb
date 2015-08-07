class RecipeAvatarUploader < AvatarUploader
    include CarrierWave::RMagick
  version :tiny do
    process resize_to_fill: [30,30]
  end

  version :small do
    process resize_to_fill: [200,100]
  end

  version :big do
    process resize_to_fill: [480,360]
  end

end
