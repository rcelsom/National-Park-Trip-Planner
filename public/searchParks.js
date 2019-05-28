function searchParks()	{
	var region = document.getElementsByClassName("region_param").value
	var attribute = document.getElementsByClassName("attribute_param").value
	var activity = document.getElementsByClassName("activity_param").value

	window.location = 'findPark/results' + encodeURI(region, attribute, activity)
}