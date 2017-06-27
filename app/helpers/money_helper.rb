module MoneyHelper

	def get_uf
		a = HTTParty.get('http://www.mindicador.cl/api/uf', :headers => hash1)
		uf = a.parsed_response['serie'].first["valor"]
		format_currency(uf)
	end
	
	def get_dolar
		uri = URI('http://www.mindicador.cl/api/dolar')
		a = Net::HTTP.get(uri)
		a = eval(a)
		dolar = a[:serie].first[:valor]
		format_currency(dolar)
	end

	def get_euro
		a = HTTParty.get('http://www.mindicador.cl/api/euro', :headers => hash1)
		euro = a.parsed_response['serie'].first["valor"]
		format_currency(euro)
	end

	def get_utm
		a = HTTParty.get('http://www.mindicador.cl/api/utm', :headers => hash1)
		utm = a.parsed_response['serie'].first["valor"]
		format_currency(utm)
	end

	private

		def hash1
			{ 'Content-type' => 'application/json; charset=utf-8' }
		end

		def format_currency(value)
			number_to_currency(value, unit: "", precision: 0)
		end

end