class UserAvatarUploader < AvatarUploader
    include CarrierWave::RMagick

  version :tiny do
    process resize_to_fill: [30,30]
  end

  version :small do
    process resize_to_fill: [60,60]
  end

  version :normal do
    process resize_to_fill: [150,150]
  end


end
