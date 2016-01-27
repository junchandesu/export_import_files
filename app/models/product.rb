class Product < ActiveRecord::Base

  require 'roo'
  belongs_to :manufacture

  def self.to_csv
  	CSV.generate do |csv|
  		# column_namesはカラム名を配列で返す
        # 例: ["id", "name", "price", "released_on", ...]
  		csv << column_names   
  		all.each do |product|
  		# attributes はカラム名と値のハッシュを返す
        # 例: {"id"=>1, "name"=>"レコーダー", "price"=>3000, ... }
        # valudes_at はハッシュから引数で指定したキーに対応する値を取り出し、配列にして返す
        # 下の行は最終的に column_namesで指定したvalue値の配列を返す
  			csv << product.attributes.values_at(*column_names)
  		end
  	end
  end

# Once xls.rb is created, it is not called for xls file
  def self.to_csv_list(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |product|
        csv << product.csv_column_values
      end

    end

  end
def self.import(file)
    spreadsheet = open_spreadsheet(file)
    return nil if spreadsheet.nil?
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      # {カラム名 => 値, ...} のハッシュを作成する
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts row, "desu"

      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      product = find_by_id(row["id"]) || new
     
      # CSVからデータを取得し、設定する
      product.attributes = row.to_hash.slice(*updatable_attributes)
      product.manufacture = find_by_manufacture_id(row["manufacture"]) || Manufacture.new(name: row["manufacture"])
      product.save!
    end
  end


  def self.csv_column_names
    %w(id name price released_on manufacture)
  end

  def csv_column_values
    [id, name, price, released_on]
  end

 # 更新を許可するカラムを定義
  def self.updatable_attributes
     ["name", "price", "released_on"]
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
     when ".csv" then Roo::CSV.new(file.path, packaged: nil, fill_warning: :ignore)
     when ".xls" then Roo::Excel.new(file.path)
     when ".xlsx" then Roo::Excelx.new(file.path,packaged: nil, fill_warning: :ignore)
     when '.ods'  then Roo::OpenOffice.new(file.path, packaged: nil, fill_warning: :ignore)
     else  nil  #raise "Unknown file type: #{file.original_filename}"
     end
  end
end
