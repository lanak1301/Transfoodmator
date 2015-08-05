class RecipeAvatarUploader < AvatarUploader
    include CarrierWave::RMagick

  version :small do
    process resize_to_fill: [200,100]
  end


end
