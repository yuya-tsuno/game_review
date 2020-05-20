class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick 

  version :resize_for_game_icon do 
    process resize_to_limit: [140, 170]
  end

  version :resize_for_user_icon do 
    process resize_to_limit: [100, 100]
  end

  storage :file # 保存形式の設定。他に使うものとしてはfog形式などがある。

  # 画像ファイルの保存先の設定。保存先を指定するには `store_dir` というメソッドに定義します。
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
