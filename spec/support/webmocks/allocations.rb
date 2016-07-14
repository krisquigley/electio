def create_allocation
  stub_request(:put, "https://api.electioapp.com/allocation/allocate").
         with(:body => "{\"ConsignmentReferences\":[\"EC-XXX-XXX-XXX\",\"EC-XXX-XXX-XXY\"]}",
              :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
end