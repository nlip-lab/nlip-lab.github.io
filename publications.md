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
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button1 {
  color: #008CBA; 
  border: 2px solid #008CBA;
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
<body>


For those interested in numbers, see Konrad's <a href="https://scholar.google.com/citations?user=MiFqJGcAAAAJ"> google scholar citations profile</a>

<hr>


{% for publi in site._bibliography.references %}
{{publi.title}}
{% endfor %}



<h3>Highlighted publications</h3>

{% assign number_printed = 0 %}
{% for publi in site.data.publications %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if publi.highlight == 1 %}


<div class="row">
<div class="col-sm-12 clearfix">
<div class="well">
<p style="text-align:left"><b>{{ publi.title }}</b></p>
<div class="row" style="padding-left: 10px; padding-right:10px"> 
  {% if publi.img %}
  <img src="{{ site.url }}{{ site.baseurl }}/publications/images/{{ publi.img }}" class="img-responsive" width="35%" style="float: left" />
  {% endif %}
  <p style="text-align:justify padding: 10px">{{ publi.description }}</p>
</div>
<div>
  <b>{{ publi.authors }}</b>
  <br><br>
  {{publi.journal}}
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
<p id="{{publi.key}}-bibtex" class="collapse" style="border-style: dashed">
<object data="{{ site.url }}{{ site.baseurl }}/publications/references/{{publi.bibtex}}" width="100%"></object>
</p>
{% endif %}

</div>
</div>
</div>

{% assign number_printed = number_printed | plus: 1 %}
{% if even_odd == 1 %}

</div>

{% endif %}
{% endif %}
{% endfor %}
{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}


<h3>Full List of publications</h3>
<ol>
{% for publi in site.data.publications %}
{% if publi.highlight == 0 %}
<div>
  <li>{{publi.apa}}</li>
  <br>
</div>
{% endif %}
{% endfor %}
</ol>


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
</body>
</html>