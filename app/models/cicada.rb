class Cicada < ActiveRecord::Base
	reverse_geocoded_by :latitude, :longitude  # 住所またはIPアドレス
    after_validation :geocode  # 保存時に自動的にジオコーディングする

end
