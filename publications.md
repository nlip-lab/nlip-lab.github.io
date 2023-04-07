---
title: Publication
permalink: /publication/
years: [2022, 2021, 2020]

---

<html>
<head>
<style>
.button {
  background-color: white;
  border: none;
  color: white;
  padding: 8px 16px;
  cursor: pointer;
  text-align: center;
  font-size: 12px;
  transition-duration: 0.5s;
  cursor: pointer;
}
.button1 {
  color: #008CBA; 
  border: 1px solid #008CBA;
  border-radius: 5px;
}
.button1:hover {
  background-color: #008CBA;
  color: white;
}
.button1:after {
  content: '\002B';
  color: white;
  font-weight: bold;
  float: center;
}
.collapsiblecontent {
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  text-align: left;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
}
</style>
</head>
</html>

For those interested in numbers, see Konrad's <a href="https://scholar.google.com/citations?user=MiFqJGcAAAAJ"> google scholar citations profile</a>
<hr>

<h3>Highlighted publications</h3>
<br>

{% for publi in site.data.publications %}
{% if publi.highlight == 1 %}
<div class="row">
<div class="col-sm-12 clearfix">
<div class="well well-lg">

<p style="text-align:left"><b>{{ publi.title }}</b></p>

<div class="row"> 
  {% if publi.img %}
  <img src="{{ site.url }}{{ site.baseurl }}/publications/images/{{ publi.img }}" class="img-responsive" width="40%" style="float:left; padding-right:20px; margin-top:15px" />
  {% endif %}
  <p style="text-align:justify; padding:10px">{{ publi.description }}</p>

  <p><b>{{ publi.authors }}</b></p>

  <p>{{publi.journal}}</p>
</div>

<div class="row">
  <ul class="nav nav-pills">
  <!-- URL -->
  {% if publi.url %}
    <li>
      <a href="{{publi.url}}">
        <button class="button button1"><b>URL</b></button>
      </a>
    </li>
  {% endif %}

  <!-- CODE -->
  {% if publi.code %}
    <li>
      <a href="{{publi.code}}">
        <button class="button button1"><b>CODE</b></button>
      </a>
    </li>
  {% endif %}

  <!-- BIBTEX -->
  {% if publi.bibtex %}
    <li>
      <a data-toggle="collapse" href="#{{publi.key}}-bibtex">
        <button class="button button1"><b>BIBTEX</b></button>
        <div class="collapsiblecontent">
        </div>
      </a>
    </li>
  {% endif %}

  <!-- ABSTRACT -->
  {% if publi.abstract %}
  <li>
    <a data-toggle="collapse" href="#{{publi.key}}-abstract">
    <button class="button button1"><b>ABSTRACT</b></button>
    </a>
  </li>
  {% endif %}
  </ul>

{% if publi.abstract %}
<p id="{{publi.key}}-abstract" class="collapse" style="border-style: dashed">{{publi.abstract}}</p>
{% endif %}

{% if publi.bibtex %}
<p id="{{publi.key}}-bibtex" class="collapse" style="border-style: dashed;">

<object data="{{ site.url }}{{ site.baseurl }}/publications/references/{{publi.bibtex}}" width="100%" style="overflow: auto;"></object>
</p>
{% endif %}
</div>
</div>
</div>
</div>
{% endif %}
{% endfor %}


<h3>Full List of publications</h3>
<ul>
{% for publi in site.data.publications %}
<div>
  <li>{{publi.apa}}</li>
</div>
{% endfor %}
</ul>


<script>
var coll = document.getElementsByClassName("button");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}
</script>