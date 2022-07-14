function sendLSPDDiscord( message )
	if ( message ) then
		triggerServerEvent( "webhook > send_message", resourceRoot, message );
	end
end
function sendLSFDDiscord( message )
	if ( message ) then
		triggerServerEvent( "webhook > send_message", resourceRoot, message );
	end
end
