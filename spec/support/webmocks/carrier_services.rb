def get_carrier_services
  stub_request(:get, "https://api.electioapp.com/carriers/").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => '{
                                              "MpdCarrierServices" : [
                                                  {
                                                      "Name" : "CarrierService01",
                                                      "Description" : "Carrier service description",
                                                      "Reference" : "MPD_CS01",
                                                      "MpdCarrierReference" : "MPD_C01",
                                                      "CarrierName" : "Carrier01",
                                                      "CarrierAccountOwner" : "Electio",
                                                      "Status" : 0,
                                                      "Journey" : [],
                                                      "IsConsolidated" : false,
                                                      "CollectionType" : "Scheduled",
                                                      "Source" : 0,
                                                      "Type" : 0,
                                                      "IsPickUp" : false,
                                                      "IsDropOff" : false,
                                                      "IsMultiHop" : false
                                                  }
                                              ]
                                          }', :headers => {})
end