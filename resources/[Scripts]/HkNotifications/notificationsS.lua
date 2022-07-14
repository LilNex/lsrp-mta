function show_box(element, message, tip, timeToShow)
	triggerClientEvent(element, "Info->box", element, message, tip, timeToShow)
end
