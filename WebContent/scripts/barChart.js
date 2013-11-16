$(document).ready(
		function() {

			var s1 = [ "33", 44240, 50223, 30232, 3223, 32343, 42332, 32223, 3234234, 32235, 523235, 323233, 2523230 ];
			var s2 = [ "20", 30, 30, 20, 23, 21, 33, 22, 24, 25, 30, 20, 150 ];
			var s3 = [ 10, 20, 10, 11, 13, 11, 15, 10, 03, 12, 12, 12, 80 ];
			var ticks = [ 'Market 1', 'Market 2', 'Market 3', 'market4',
					'market5', 'market6', 'market7', 'market8', 'market9',
					'market10', 'market11', 'market12', 'Total' ];

			plot3 = $.jqplot('chart3', [ s1, s2, s3 ], {
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
						label : '마켓별',
						renderer : $.jqplot.CategoryAxisRenderer,
						ticks : ticks,
						
						// Rotate -30 degree
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
						tickOptions: {formatString: "%'d" }, 
						label : 'App 개수',
						labelRenderer : $.jqplot.CanvasAxisLabelRenderer,
						padMin : 0
					}
				},

				seriesColors : [ "rgb(30, 200, 200)", "rgb(30, 30, 180)",
						"rgb(255, 0, 0)" ],

				series : [ {
					label : '전체 App'
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

function showBarGraph(s1, s2, s3) {
	var ticks = 'Total';

	$.jqplot('chartTest', [ s1, s2, s3 ], {
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
				label : '��ó',
				renderer : $.jqplot.CategoryAxisRenderer,
				ticks : ticks
			},
			yaxis : {
				// Don't pad out the bottom of the data range. By default,
				// axes scaled as if data extended 10% above and below the
				// actual range to prevent data points right on grid boundaries.
				// Don't want to do that here.
				label : 'App 개수',
				labelRenderer : $.jqplot.CanvasAxisLabelRenderer,
				padMin : 0
			}
		},

		seriesColors : [ "rgb(30, 200, 200)", "rgb(30, 30, 180)",
				"rgb(255, 0, 0)" ],

		series : [ {
			label : '���� App'
		}, {
			label : 'Unique App'
		}, {
			label : '�Ǽ� App'
		} ],

		legend : {
			show : true,
			location : 'ne',
			placement : 'outside'
		}
	});
}
