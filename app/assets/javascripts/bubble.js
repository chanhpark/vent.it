var width = 1250,
height = 400,
padding = 1.5, // separation between same-color nodes
clusterPadding = 6, // separation between nodes
maxRadius = 12;

var n = 300, // total number of nodes
m = 1; // number of distinct clusters

var color = d3.scale.category10()
.domain(d3.range(m));

// The largest node for each cluster.
var clusters = new Array(m);

d3.json("/words.json", function(error, root) {
  var nodes = root.map(function(x) {
    var i = Math.floor(Math.random() * m),
    r = Math.log(x.count) * maxRadius,
    d = {cluster: i, radius: r, text: x._id, count: x.count};
    if (!clusters[i] || (r > clusters[i].radius)) clusters[i] = d;

    return d;
  });

  // Use the pack layout to initialize node positions.
  d3.layout.pack()
  .sort(null)
  .size([width, height])
  .children(function(d) { return d.values; })
  .value(function(d) { return d.radius * d.radius; })
  .nodes({values: d3.nest()
    .key(function(d) { return d.cluster; })
    .entries(nodes)});

    var force = d3.layout.force()
    .nodes(nodes)
    .size([width, height])
    .gravity(.02)
    .charge(0)
    .on("tick", tick)
    .start();

    var svg = d3.select("word-cloud").append("svg")
    .attr("width", width)
    .attr("height", height);

    var node = svg.selectAll("circle")
    .data(nodes)
    .enter().append("circle")
    .filter(function(d){ return d.count > 1; })
    .style("fill", function(d) { return '#dcbeef'; })
    .call(force.drag);

    var label = svg.selectAll("g")
    .data(nodes)
    .enter().append("g")
    .filter(function(d){ return d.count > 1; })
    .call(force.drag);

    label.append("text")
    .style("text-anchor", "middle")
    //Font size based on radius
    .style("font-size", function(d) { return Math.max(8, d.radius / 2) + "px"; })
    .style("width", function(d) { return d.radius * 2.5 + "px"; })
    .text(function(d) { return d.text; })

    label.append("text")
    .attr("dy", function(d) { return Math.max(8, d.radius / 2) + "px"; })
    .style("text-anchor", "middle")
    //Font size based on radius
    .style("font-size", function(d) { return Math.max(8, d.radius / 4) + "px"; })
    .style("width", function(d) { return d.radius * 2.5 + "px"; })
    .text(function(d) { return d.count; })


    node.transition()
    .duration(750)
    .delay(function(d, i) { return i * 5; })
    .attrTween("r", function(d) {
      var i = d3.interpolate(0, d.radius);
      return function(t) { return d.radius = i(t); };
    });


    function tick(e) {
      node
      .each(gravity(e.alpha * .1))
      .each(collide(.5))
      //Max min to stay within bounding box
      .attr("cx", function(d) { return d.x = Math.max(d.radius, Math.min(width - d.radius, d.x)); })
      .attr("cy", function(d) { return d.y = Math.max(d.radius, Math.min(height - d.radius, d.y)); });

      label
      .each(gravity(e.alpha * .1))
      .each(collide(.5))
      .attr("transform", function(d) {
        var x = Math.max(d.radius, Math.min(width - d.radius, d.x));
        var y = Math.max(d.radius, Math.min(height - d.radius, d.y));

        return 'translate(' + x + ',' + y + ')';
      });
    }

    // Move d to be adjacent to the cluster node.
    function cluster(alpha) {
      return function(d) {
        var cluster = clusters[d.cluster];
        if (cluster === d) return;
        var x = d.x - cluster.x,
        y = d.y - cluster.y,
        l = Math.sqrt(x * x + y * y),
        r = d.radius + cluster.radius;
        if (l != r) {
          l = (l - r) / l * alpha;
          d.x -= x *= l;
          d.y -= y *= l;
          cluster.x += x;
          cluster.y += y;
        }
      };
    }

    // Resolves collisions between d and all other circles.
    function collide(alpha) {
      var quadtree = d3.geom.quadtree(nodes);
      return function(d) {
        var r = d.radius + maxRadius + Math.max(padding, clusterPadding),
        nx1 = d.x - r,
        nx2 = d.x + r,
        ny1 = d.y - r,
        ny2 = d.y + r;
        quadtree.visit(function(quad, x1, y1, x2, y2) {
          if (quad.point && (quad.point !== d)) {
            var x = d.x - quad.point.x,
            y = d.y - quad.point.y,
            l = Math.sqrt(x * x + y * y),
            r = d.radius + quad.point.radius + (d.cluster === quad.point.cluster ? padding : clusterPadding);
            if (l < r) {
              l = (l - r) / l * alpha;
              d.x -= x *= l;
              d.y -= y *= l;
              quad.point.x += x;
              quad.point.y += y;
            }
          }
          return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
        });
      };
    }

    // Custom gravity to favor a non-square aspect ratio.
    function gravity(alpha) {
      var cx = width / 2,
      cy = height / 2,
      ax = alpha / 4,
      ay = alpha;
      return function(d) {
        d.x += (cx - d.x) * ax;
        d.y += (cy - d.y) * ay;
      };
    }


  }); //End JSON
