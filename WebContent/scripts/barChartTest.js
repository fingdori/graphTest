$(document).ready(
		function() {
			var s1 = $(document).getElementById('total').value;
			var s2 = $(document).getElementById('unique').value;
			var s3 = $(document).getElementById('mal').value;

			var ticks = '2013-1월';

			plot3 = $.jqplot('chartTest', [ s1, s2, s3 ], {
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
						ticks : ticks
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
		});