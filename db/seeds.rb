a = Manufacture.create! name: "AElectric"
%w(recorder earphone microphone webcamera).each do |name|
	random =[*1..5].sample
	a.products.create! name: name, price: random * 1000, released_on: random.day.ago
end

b = Manufacture.create! name: "B-industory"
%w(washer refregirator air-conditionar).each do |name|
	random = [*1..5].sample
	b.products.create! name:name, price: random * 1000, released_on: random.day.ago
end

c = Manufacture.create! name: "C-electronics"
%w(notebook tv digital-camera).each do |name|
	random = [*1..5].sample
	c.products.create! name: name, price: random * 1000, released_on: random.day.ago
end