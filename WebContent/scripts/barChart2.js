$(document).ready(
		function() {

			var s1 = [ 33, 40, 50, 30 ];
			var s2 = [ 20, 30, 30, 20];
			var s3 = [ 10, 20, 10, 11 ];
			var ticks = [ '2013-1월', '2012-12월', '2012-11월', '2012-10월' ];

			plot3 = $.jqplot('chart3_2', [ s1, s2, s3 ], {
				// Tell the plot to stack the bars.
				stackSeries : false,
				captureRightClick : true,
				seriesDefaults : {
					renderer : $.jqplot.BarRenderer,
					rendererOptions : {
						// Put a 30 pixel margin between bars.
						barMargin : 20,
						// Highlight bars when mouse button pressed.
						// Disables default highlighting on mouse over.
						highlightMouseDown : true
					},
					pointLabels : {
						show : true
					}
				},

				axes : {
					xaxis : {
						label : '출처',
						renderer : $.jqplot.CategoryAxisRenderer,
						ticks : ticks,
						
						// lotate -30 degree
						tickRenderer: $.jqplot.CanvasAxisTickRenderer , 
						tickOptions: {
							angle: -30,
							fontSize: '15pt'
						}
					},
					yaxis : {
						// Don't pad out the bottom of the data range. By
						// default,
						// axes scaled as if data extended 10% above and below
						// the
						// actual range to prevent data points right on grid
						// boundaries.
						// Don't want to do that here.
						label : 'App 수',
						labelRenderer : $.jqplot.CanvasAxisLabelRenderer,
						padMin : 0
					}
				},

				seriesColors : [ "rgb(30, 200, 200)", "rgb(30, 30, 180)",
						"rgb(255, 0, 0)" ],

				series : [ {
					label : '수집 App'
				}, {
					label : 'Unique App'
				}, {
					label : '악성 App'
				} ],

				legend : {
					show : true,
					location : 'ne',
					placement : 'outside'
				}
			});
			// Bind a listener to the "jqplotDataClick" event. Here, simply
			// change
			// the text of the info3 element to show what series and ponit were
			// clicked along with the data for that point.
			/*
			 * $('#chart3').bind('jqplotDataClick', function (ev, seriesIndex,
			 * pointIndex, data) { $('#info3').html('series: '+seriesIndex+',
			 * point: '+pointIndex+', data: '+data); } );
			 */
		});