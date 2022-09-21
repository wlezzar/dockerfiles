# AdventureWorks for Postgres
#  by Lorin Thwaits

# How to use this file:

# Download "Adventure Works 2014 OLTP Script" from:
#   https://msftdbprodsamples.codeplex.com/downloads/get/880662

# Extract the .zip and copy all of the CSV files into the same folder containing
# this update_csvs.rb file and the install.sql file.

# Modify the CSVs to work with Postgres by running:
#   ruby update_csvs.rb

# Create the database and tables, import the data, and set up the views and keys with:
#   psql -c "CREATE DATABASE \"Adventureworks\";"
#   psql -d Adventureworks < install.sql

# Production.ProductReview gets omitted, but the remaining 67 tables are properly set up.
# As well, 11 of the 20 views are established.  The ones not built are those that rely on
# XML functions like value and ref.

# Enjoy!


Dir.glob('./*.csv') do |csv_file|
  f = File.open(csv_file, "rb:UTF-16LE:utf-8")
  output = ""
  text = ""
  is_needed=false
  is_first = true
  is_plus_pipe = false
  is_pipes = false
  begin
  f.each do |line|
    if is_first
      if line.include?("+|")
        is_pipes = true
      end
      if line[0] == "\uFEFF"
        line = line[1..-1]
        is_needed = true
      end
    end
    is_first = false
    break if !is_needed
    if is_pipes
      if line.strip.end_with?("&|")
        text << line.gsub(/\"/, "\"\"").strip[0..-3]
        output << text.split("+|").map { |part|
          part.include?("\t") ? '"' + part + '"' : part
        }.join("\t")
        output << "\n"
        text = ""
      else
        text << line.gsub(/\"/, "\"\"").gsub("\r\n", "\\n")
      end
    else
      output << line.gsub(/\"/, "\"\"").gsub(/\&\|\n/, "\n").gsub(/\&\|\r\n/, "\n")
    end
  end
  if is_needed
    puts "Processing #{csv_file}"
    f.close
    w = File.open(csv_file + ".xyz", "w")
    w.write(output)
    w.close
    File.delete(csv_file)
    File.rename(csv_file + ".xyz", csv_file)
  end

  # Here's a list of files that get snagged here:
  #    Address.csv
  #    AWBuildVersion.csv
  #    CreditCard.csv
  #    Culture.csv
  #    Currency.csv
  #    Department.csv
  #    EmployeeDepartmentHistory.csv
  #    EmployeePayHistory.csv
  #    Product.csv
  #    ProductCostHistory.csv
  #    ProductModelIllustration.csv
  #    ProductReview.csv
  #    SalesOrderDetail.csv
  #    SalesTerritory.csv
  #    Shift.csv
  #    ShipMethod.csv
  #    ShoppingCartItem.csv
  #    SpecialOffer.csv
  #    Vendor.csv
  #    WorkOrder.csv
  rescue Encoding::InvalidByteSequenceError
    f.close
  end
end