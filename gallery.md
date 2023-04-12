---
title: Gallery
permalink: /gallery/
---

<html lang="en">
<head>
<style>
* {
box-sizing: border-box;
    }
.wrapper {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 10px;
    }
.row {
  width:100%;
  margin: 1px;
}
.row,
.row > .column {
  padding: 2px;
}
.column {
  float: left;
  width: 33.33%;
  display: block; /* Hide all elements by default */
}
/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}
/* Content */
.content {
  background-color: white;
  padding: 10px;
}
/* The "show" class is added to the filtered elements */
.show {
  display: block;
}
/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}
.btn:hover {
  background-color: #ddd;
}
.btn.active {
  background-color: #666;
  color: white;
}
</style>
</head>
<body>

<h3> {{site.name}} Gallery </h3>

<span style="display: block; margin-bottom: 2em"></span>

<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> Show all</button>
  {% assign tags = '' %}
  
  <!-- loop through all images and add their tags to the tags variable separated by a comma-->
  {% for img in site.data.gallery %}
    {% assign tags = tags | append: img.tag | append: ' ' %}
  {% endfor %}

  <!-- remove duplicates -->
  {% assign tags = tags | split: ' ' %}

  <!-- remove the duplicates -->
  {% assign tags = tags | uniq %}  

  <!-- loop through the tags variable and create a button for each tag -->
  {% for tag in tags %}
      <button class="btn" onclick="filterSelection('{{ tag }}')">{{ tag }}</button>
  {% endfor %}  
</div>

  <div class="row">
  {%for img in site.data.gallery%}
  <div class="column {{img.tag}}">
    <div class="content">
    <a href="/images/gallery/{{img.img}}"><img src="/images/gallery/{{img.img}}" style="width:100%; height:200px; overflow:hidden"></a>
    <p style="text-align:center;">{{img.caption}}</p>
    </div>
  </div>
  {%endfor%}

</div>

<hr>

<h3 id="#contact"> Contact Us </h3>
<span style="display: block; margin-bottom: 3em"></span>

<!-- CONTACT -->
<div class="row" style="margin-top:50px">
    <div class="column" style="float:left; width:250px; text-align:center; padding-right:10px">
        <h4>Address</h4>
        <p>{{site.address}}</p>
    </div>
    <div class="column" style="float:left; width:250px; text-align:center; padding-right:10px">
        <h4>Phone</h4>
        <p>{{site.phone}}</p>
    </div>
    <div class="column" style="float:left; width:250px; text-align:center; padding-right:10px">
        <h4>Office Hours:</h4>
        <p>{{site.office_hours}}</p>
    </div>
</div>

<!-- LAB LOCATION -->
<div style="position:relative; width:100%; height:500px">
  <iframe 
    src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1866.6682220334442!2d78.12359467897458!3d17.595584129661564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1680867993295!5m2!1sen!2sin" 
    style="width:100%; height:100%"
    title="Google Maps Location of {{site.name}}" 
    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
    allowfullscreen>
    </iframe>
</div>

<span style="display: block; margin-bottom: 3em"></span>


<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}
function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}
function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>


</body>
</html>