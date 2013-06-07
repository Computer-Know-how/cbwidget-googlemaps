/**
* A widget that renders a Google Map
*/
component extends="contentbox.model.ui.BaseWidget" singleton{

	GoogleMaps function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setPluginName("GoogleMaps");
		setPluginVersion("1.0");
		setPluginDescription("A widget that renders a google map by address or latitude/longitude.");
		setForgeBoxSlug("cbwidget-googlemaps");
		setPluginAuthor("Computer Know How");
		setPluginAuthorURL("http://www.compknowhow.com");
		// setIcon( "list.png" );
		setCategory( "Utilities" );

		return this;
	}

	/**
	* Renders a goole map
	* @address.hint Address to map to.  If you are not using latitude/longitude
	* @latitude.hint Latitude to map. If you would rather you can use the latitude/longitude instead of an address
	* @longitude.hint Longitude to map. If you would rather you can use the latitude/longitude instead of an address
	* @zoomLevel.hint Zoom level to map to.
	* @width.hint Width of the map
	* @height.hint Height of the map
	*/
	any function renderIt(string address="",string latitude="",string longitude="",numeric zoomLevel="8", numeric width="425", numeric height="350"){
		//if they are using lat/long use that
		if(len(arguments.latitude) && len(arguments.longitude)) {
			return '
				<iframe width="#arguments.width#" height="#arguments.height#" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/?ie=UTF8&amp;ll=#arguments.latitude#,#arguments.longitude#&amp;t=h&amp;z=#arguments.zoomLevel#&amp;output=embed"></iframe>
				<br />
				<small><a href="https://maps.google.com/?ie=UTF8&amp;ll=#arguments.latitude#,#arguments.longitude#&amp;t=h&amp;z=#arguments.zoomLevel#&amp;source=embed" style="color:##0000FF;text-align:left">View Larger Map</a></small>';
		}
		//setup the address and embed the map
		var arguments.address = replace(arguments.address," ","+","all");
		return '
				<iframe width="#arguments.width#" height="#arguments.height#" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/?ie=UTF8&amp;q=#arguments.address#&amp;t=h&amp;z=#arguments.zoomLevel#&amp;output=embed"></iframe>
				<br />
				<small><a href="https://maps.google.com/?ie=UTF8&amp;q=#arguments.address#t&amp;t=h&amp;z=#arguments.zoomLevel#&amp;source=embed" style="color:##0000FF;text-align:left">View Larger Map</a></small>';
	}


}