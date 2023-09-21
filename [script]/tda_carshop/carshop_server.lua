function buyVehicle( player, database, amount, vehicle, mark, series, model, red, green, blue, red2, green2, blue2 )
	if getAccountData( getPlayerAccount( player ), database ) >= amount then
		if setAccountData( getPlayerAccount( player ), database, getAccountData( getPlayerAccount( player ), database ) - amount ) then
			for i=1,512 do
				if getAccountData( getPlayerAccount( player ), "vehicle"..i ) == 0 then
					setAccountData( getPlayerAccount( player ), "vehicle"..i, vehicle )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."red", red )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."green", green )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."blue", blue )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."red2", red2 )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."green2", green2 )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."blue2", blue2 )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."nos", 0 )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."wheel", 0 )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."lightr", 255 )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."lightg", 255 )
					setAccountData( getPlayerAccount( player ), "vehicle"..i.."lightb", 255 )
					triggerClientEvent( player, "onClientNatificationVehicle", player, 0, database )
					break
				end
			end
		end
	else
		triggerClientEvent( player, "onClientNatificationVehicle", player, 1, database )
	end
end
addEvent( "onBuyVehicle", true )
addEventHandler( "onBuyVehicle", root, buyVehicle )