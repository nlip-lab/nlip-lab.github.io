---
title: Publication
permalink: /publication/
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

<p><i>Jump to the full list of publications, <a href="#full-list"> here</a></i></p>


<h3>Highlighted publications</h3>
<span style="display: block; margin-bottom: 1 em"></span>

{% for publi in site.data.publications %}
    {%if publi.month==1%}{%assign month="January"%}{%endif%}
    {%if publi.month==2%}{%assign month="February"%}{%endif%}
    {%if publi.month==3%}{%assign month="March"%}{%endif%}
    {%if publi.month==4%}{%assign month="April"%}{%endif%}
    {%if publi.month==5%}{%assign month="May"%}{%endif%}
    {%if publi.month==6%}{%assign month="June"%}{%endif%}
    {%if publi.month==7%}{%assign month="July"%}{%endif%}
    {%if publi.month==8%}{%assign month="August"%}{%endif%}
    {%if publi.month==9%}{%assign month="September"%}{%endif%}
    {%if publi.month==10%}{%assign month="October"%}{%endif%}
    {%if publi.month==11%}{%assign month="November"%}{%endif%}
    {%if publi.month==12%}{%assign month="December"%}{%endif%}

{%if publi.key%}
{% if publi.highlight == 1 %}
<div class="row">
<div class="col-sm-12 clearfix">
<div class="well well-lg" style="background-color: #fcfbfb;">

<p style="text-align:left; font-size:18px; display:inline;"><b>{{ publi.title }}</b> <p style="display:inline;font-size:15px; color: #363636;">[{{month}}, {{publi.year}}]</p></p>

<div class="row"> 
  {% if publi.img %}
  <img src="{{ site.url }}{{ site.baseurl }}/publications/images/{{ publi.img }}" class="img-responsive" width="40%" style="float:left; padding-right:20px;" />
  {% endif %}

  {% if publi.summary %}
  <p style="text-align:justify; padding-left:10px; padding-right:10px">{{ publi.summary }}</p>
  {% endif %}


  <p style="padding-left:15px;"><b>{{ publi.authors }}</b></p>

  <p style="padding-left:15px;">{{publi.journal}}</p>
</div>

<div class="row">
  <ul class="nav nav-pills">

  <!-- ABSTRACT -->
  {% if publi.abstract %}
  <li>
    <a data-toggle="collapse" href="#{{publi.key}}-abstract">
    <button class="button button1"><b>ABSTRACT</b></button>
    </a>
  </li>
  {% endif %}

  <!-- URL -->
  {% if publi.url %}
    <li>
      <a href="{{publi.url}}" target="_blank">
        <button class="button button1"><b>URL</b></button>
      </a>
    </li>
  {% endif %}

  <!-- URL -->
  {% if publi.pdf %}
    <li>
      <a href="{{publi.pdf}}" target="_blank">
        <button class="button button1"><b>PDF</b></button>
      </a>
    </li>
  {% endif %}

  <!-- CODE -->
  {% if publi.code %}
    <li>
      <a href="{{publi.code}}" target="_blank">
        <button class="button button1"><b>CODE</b></button>
      </a>
    </li>
  {% endif %}

  <!-- BIBTEX -->
  {% if publi.key %}
    <li>
      <a data-toggle="collapse" href="#{{publi.key}}-bibtex">
        <button class="button button1"><b>BIBTEX</b></button>
        <div class="collapsiblecontent">
        </div>
      </a>
    </li>
  {% endif %}

  <!-- VIDEO -->
  {% if publi.video %}
    <li>
      <a href="{{publi.video}}" target="_blank">
        <button class="button button1"><b>VIDEO</b></button>
      </a>
    </li>
  {% endif %}

  </ul>

{% if publi.abstract %}
<p id="{{publi.key}}-abstract" class="collapse" style="border-style: dashed; text-align:justify;">{{publi.abstract}}</p>
{% endif %}

{% if publi.key %}
<p id="{{publi.key}}-bibtex" class="collapse" style="border-style: dashed;">

<object data="{{ site.url }}{{ site.baseurl }}/publications/references/{{publi.key}}.txt" width="100%" style="overflow: auto;"></object>
</p>
{% endif %}
</div>
</div>
</div>
</div>
{% endif %}
{% endif %}
{% endfor %}


<span style="display: block; margin-bottom: 3 em"></span>


<h3 id="full-list">Full List of publications</h3>
<span style="display: block; margin-bottom: 1 em"></span>

{% for y in site.publications_years %}

<h4 class="year">{{y}}</h4>
<span style="display: block; margin-bottom: 2 em"></span>

{% for publi in site.data.publications %}
{% if publi.year==y%}

<div style="text-align:justify; padding: 15px;  border-radius:5px; border: 1px solid #5d8aa8; margin-bottom:5px; background: #f9f9f9">
    {{publi.authors}}. <a href="{{publi.url}}" style="text-decoration:none;" target="_blank">{{publi.title}}</a>. {{publi.journal}}.
</div>

{%endif%}
{% endfor %}
<span style="display: block; margin-bottom: 3 em"></span>

{% endfor %}




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