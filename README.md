## RailsでCSV/Excelのダウンロード機能の実装方法: Exporting CSV and Excel 
## Google map

---

### Tools/Libraries 
* Mime, cvs library to call each class
* xml to convert to excel file
* colum_names method to call all of the columns names on the model
* attributes method create a hash for colums and values
* gem roo to upload csv, excel, xlsx, ods files
* row(line) method in the file after Roo class is instantiated to fine the line
* last_row method is the last line in the file object
* transpose method in array inside array, 配列の配列を行と列からなるデータと見立てて、行と列を入れ替えた配列の配列を作成して返します。配列内の各配列の要素数が一致しないときは例外IndexErrorが発生します
* multipart: true inside form_tag


RailsでCSVやExcelをダウンロード（エクスポート）する方法を説明します。
Ransackなどで検索機能をつければ、検索結果に応じたCSV/Excel出力も可能です。

Reference: 
export http://ruby-rails.hatenadiary.com/entry/20141119/1416398472
import http://ruby-rails.hatenadiary.com/entry/20141120/1416483136
Video: 
export http://railscasts.com/episodes/362-exporting-csv-and-excel

google map
Reference: http://qiita.com/cigalecigales/items/bfdaa07a7fa29a4175cb
		   http://qiita.com/cigalecigales/items/9dda1f67cea215c0feab
map design: https://snazzymaps.com/