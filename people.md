---
title: People
permalink: /people/
---

{% assign people_sorted = site.people | sort: 'joined' %}
{% assign role_array = "professor|postdoc|phd|masters|researchstaff|visiting|others|alumni" | split: "|" %}

{% for role in role_array %}

{% assign people_in_role = people_sorted | where: 'position', role %}

<!-- Skip section if there's nobody -->
{% if people_in_role.size == 0 %}
  {% continue %}
{% endif %}

<div class="pos_header">
{% if role == 'phd' %}
<h3>PhD Students</h3>
 {% elsif role == 'professor' %}
<h3>Professor</h3>
 {% elsif role == 'masters' %}
<h3>M.Tech Students</h3>
 {% elsif role == 'researchstaff' %}
<h3>Research Staff</h3>
 {% elsif role == 'visiting' %}
<h3>Visiting Scholars</h3>
 {% elsif role == 'others' %}
<h3>Alumni students</h3>
{% endif %}
</div>

{% if role != 'alumni' %}
<div class="content list people">
  {% for profile in people_sorted %}
    {% if profile.position contains role %}
      <div class="list-item-people">
        <p class="list-post-title">
          {% if profile.avatar %}
            <a href="{{ site.baseurl }}{{ profile.url }}"><img class="profile-thumbnail" src="{{site.baseurl}}/images/people/{{profile.avatar}}" style="border: 1px solid #e6e6e6"></a>
          {% else %}
            <a href="{{ site.baseurl }}{{ profile.url }}"><img class="profile-thumbnail" src="http://evansheline.com/wp-content/uploads/2011/02/facebook-Storm-Trooper.jpg"></a>
          {% endif %}
          <a class="name" href="{{ site.baseurl }}{{ profile.url }}">{{ profile.name }}</a>
        </p>
      </div>    
    {% endif %}
  {% endfor %}
</div>
<hr>

{% else %}

<br>

| Who are they | When were they here | Where they went |
| :------------- |:-------------| :-----------|
| [Sharan Narasimhan](https://www.linkedin.com/in/sharan21/) | Masters student (2020-2022) | Data Engineer at Indeed|
| [Venkatesh E](https://www.linkedin.com/in/venkateshelangovan/) | Masters student (2020-2022) |  Machine Learning Engineer @ Qualcomm
| [Arkadipta De](https://www.linkedin.com/in/arkadipta-de/) | Masters student (2020-2022) | Applied AI Researcher @ Fujitsu Research India|
| [Sagar Jinde ](https://www.linkedin.com/in/sagarjinde/) | Masters student (2019-2021) | Machine Learning Engineer @ Qualcomm|
| [Vikram Anand Singh ](https://www.linkedin.com/in/vikramanandsingh/) |Masters student(2018 - 2020) |Software Developer at BNY Mellon Technology|
| [Shounak Kundu](https://www.linkedin.com/in/shounak-kundu-53977817/) |Masters student ,3-Year MTech, joint supervision with Dr. Srijith PK (2018-2021) | Machine Learning Engineer @InMobi  |
| [Rishik Ramena ](https://www.linkedin.com/in/rishik-ramena-0a0b52b0/) | Masters student,3-Year MTech, joint supervision with Dr. Srijith PK (2018 ) | Software Engineer at Microsoft |
| [Priyambada Ambastha](https://www.linkedin.com/in/priyambada-ambastha-133962119/) | Masters student,3-Year MTech, joint supervision with Dr. Srijith PK (2018 - 2021) | Applied Scientist @Amazon  |
| [Rashmi HTI ](https://www.linkedin.com/in/rashmi-hti-3bb52039/) | Masters student (2016-2018) | Associate @ Goldman Sachs |
| [Priyanka Choudhary](https://www.linkedin.com/in/priyanka-choudhary-9b0b46111/) | Masters student (2016-2018) | Lecturer @rpsc technical education department |
| [Shamik Kundu ](https://www.linkedin.com/in/shamikkundu/) | Masters student (2016-2018) |Data Scientist @Rakuten  |
| [Manjela Toppo ](https://www.linkedin.com/in/manjela-toppo-021342154/) | Masters student(2016-2018) |  |
| [Shashank Singh](https://www.linkedin.com/in/shashank-singh-a527bb112/) | Masters Student (2015-2017) |Software Developer at PayPal|
| [Pradyumna Deshpande ](https://www.linkedin.com/in/pradyumna-deshpande-72a51455/) | Masters Student (2015-2017) | Platform Engineer@ PayPay Corporation Tokyo,Japan |
| [Swapnil Ashok dewalakar ]() | Masters student () |  |
| [Vandita Dutt ]() | Masters student () |


{% endif %}
{% endfor %}
