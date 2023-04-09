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
</style>
</head>

<body>

<h3> {{site.name}} Gallery </h3>

<span style="display: block; margin-bottom: 3em"></span>

<div class="wrapper">
    {%for img in site.data.gallery%}
    <div>
    <a target="_blank" href="/images/gallery/{{img.img}}">
        <img class="expand" src="/images/gallery/{{img.img}}" width="100%" height="auto" style="border-radius:15px;">
    </a>
    </div>
    {%endfor%}
</div>

<hr>

<h3> Contact Us </h3>
<span style="display: block; margin-bottom: 3em"></span>

<!-- CONTACT -->
<div class="row" style="margin-top:50px">
    <div class="column" style="float:left; width:250px; text-align:right; padding-right:10px">
        <h4>Address</h4>
        <p>Research Laboratory<br>
            999 Fake Street Avenue<br>
            City, State<br>
            Country ZIP
        </p>
    </div>
    <div class="column" style="float:left; width:250px; text-align:right; padding-right:10px">
        <h4>Phone</h4>
        <p>Phone : 999-999-9999<br>
            Cell : 999-999-9999
        </p>
    </div>
    <div class="column" style="float:left; width:250px; text-align:right; padding-right:10px">
        <h4>Office Hours:</h4>
        <p>Monday-Friday (8.00am - 5.00pm)</p>
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

</body>
</html>