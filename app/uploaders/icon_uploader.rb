class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick 

  version :resize_for_game_icon do 
    process resize_to_limit: [140, 170]
  end

  version :resize_for_user_icon do 
    process resize_to_limit: [100, 100]
  end
end
