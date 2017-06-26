module MoneyHelper

	def get_uf
		a = HTTParty.get('http://www.mindicador.cl/api/uf', :headers => hash1)
		uf = a.parsed_response['serie'].first["valor"]
	end
	
	def get_dolar
		uri = URI('http://www.mindicador.cl/api/dolar')
		a = Net::HTTP.get(uri)
		a = eval(a)
		dolar = a[:serie].first
	end

	def get_euro
		a = HTTParty.get('http://www.mindicador.cl/api/euro', :headers => hash1)
		euro = a.parsed_response['serie'].first
	end

	def get_utm
		a = HTTParty.get('http://www.mindicador.cl/api/utm', :headers => hash1)
		utm = a.parsed_response['serie'].first
	end

	private

		def hash1
			{ 'Content-type' => 'application/json; charset=utf-8' }
		end

end