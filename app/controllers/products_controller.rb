class ProductsController < ApplicationController

  def index
  	@products = Product.includes(:manufacture)
  	    respond_to do |format|
  		format.html
  		format.csv { send_data @products.to_csv_list}
  		format.xls { send_data @products.to_csv_list(col_sep: "\t")}
  		# format.csv { send_data @products.to_csv}
  		# to_csv method uses the colums_names for all of the attributes on Product model
  	end
  end  

  def import
  	# file is saved temporarily in tmp
  	file = Product.import(params[:file])
    if file.nil?
  	  redirect_to root_url, notice: "#{params[:file]} is not proper file to upload."
  	else
  	   redirect_to root_url, notice: "New colum is added"
    end
  end
end
