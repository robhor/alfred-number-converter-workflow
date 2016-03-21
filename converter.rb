class Item
	def initialize(uid, arg, title, subtitle='')
		@uid = uid
		@arg = arg
		@title = title
		@subtitle = subtitle
	end

	def to_xml
		o = "<item uid=\"#@uid\" arg=\"#@arg\">"
		o+= "<title>#{@title}</title>"
		o+= "<subtitle>#{@subtitle}</subtitle>"
		o+= "<icon>icon.png</icon>"
		o+= "</item>"
		puts o
	end
end

items = []

query = ARGV.join(" ")
begin
	query = "0" + query if query.start_with? "b"
	i = Integer(query)

	items << Item.new("bin", i.to_s(2), i.to_s(2), "Binary")
	items << Item.new("oct", "0"+i.to_s(8), "0"+i.to_s(8), "Octagonal")
	items << Item.new("dec", i, i, "Decimal")
	items << Item.new("hex", "0x"+i.to_s(16), "0x"+i.to_s(16), "Hexadecimal")
rescue
	items << Item.new("error", query, "Could not convert number", "Invalid format")
end

puts "<items>"
items.each(&:to_xml)
puts "</items>"