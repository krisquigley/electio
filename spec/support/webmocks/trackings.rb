def find_tracking_details
  stub_request(:get, "https://api.electioapp.com/tracking/EC-098-023-D3E").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.open("spec/fixtures/tracking_events_by_consignment_reference.json", "r"), :headers => {})

  stub_request(:get, "https://api.electioapp.com/tracking/clientreference/test-client").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.open("spec/fixtures/tracking_events_by_client_reference.json", "r"), :headers => {})
end