def get_carriers
  stub_request(:get, "https://api.electioapp.com/carriers/getcarriers").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => '[
                                                {
                                                    "Reference" : "C01",
                                                    "Name" : "Carrier01"
                                                },
                                                {
                                                    "Reference" : "C02",
                                                    "Name" : "Carrier02"
                                                },
                                                {
                                                    "Reference" : "C03",
                                                    "Name" : "Carrier03"
                                                }
                                            ]', :headers => {})
end