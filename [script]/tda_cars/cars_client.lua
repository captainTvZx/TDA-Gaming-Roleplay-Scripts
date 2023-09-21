function renderVehicleModel(  )
	for i = 400, 604 do
		if fileExists( "vehicles/"..i..".dff" ) and fileExists( "vehicles/"..i..".txd" ) then
			vehicleTexture = engineLoadTXD ( "vehicles/"..i..".txd" )
			engineImportTXD ( vehicleTexture, i )
			vehicleModels = engineLoadDFF ( "vehicles/"..i..".dff" )
			engineReplaceModel ( vehicleModels, i )
		end
	end
end
addEventHandler( "onClientResourceStart", resourceRoot, renderVehicleModel)