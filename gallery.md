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
.column {
  float: left;
  display: none;
}
/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
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

<h3 style="margin-left:50px"> {{site.name}} Gallery </h3>

<div class="row" style="margin-left:45px;">
  {%for img in site.data.gallery%}
  <div class="column {{img.tag}}" style="white-space: initial; padding:2px;">
    <a href="/images/gallery/{{img.img}}" target="_blank"><img src="/images/gallery/{{img.img}}" style="height:200px; width:250px; overflow:hidden"></a>
    <p style="text-align:center; width:250px;">{{img.caption}}</p>
  </div>
  {%endfor%}
</div>

<div id="myBtnContainer" style="text-align:center; margin-left:-200px; padding:10px">
  <button class="btn active" onclick="filterSelection('1')">1</button>
  {% assign tags = '' %}
  
  <!-- loop through all images and add their tags to the tags variable separated by a comma-->
  {% for img in site.data.gallery %}
    {% assign tags = tags | append: img.tag | append: ' ' %}
  {% endfor %}

  <!-- remove duplicates -->
  {% assign tags = tags | split: ' ' %}

  <!-- remove the duplicates -->
  {% assign tags = tags | uniq %}  

  <!-- remove the tag "1" -->
  {% assign tags = tags | where_exp: "item", "item != '1'" %}

  <!-- loop through the tags variable and create a button for each tag -->
  {% for tag in tags %}
      <button class="btn" onclick="filterSelection('{{ tag }}')">{{ tag }}</button>
  {% endfor %}  
</div>

<span style="display: block; margin-bottom: 2em"></span>


<script>
filterSelection("1")
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