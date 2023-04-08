---
title: News
permalink: /news/
---

{%- for y in site.news_years %}
<h4>{{y}}</h4>

<div>
{% for new in site.data.news %}
{%if new.month==1%}{%assign month="January"%}{%endif%}
{%if new.month==2%}{%assign month="February"%}{%endif%}
{%if new.month==3%}{%assign month="March"%}{%endif%}
{%if new.month==4%}{%assign month="April"%}{%endif%}
{%if new.month==5%}{%assign month="May"%}{%endif%}
{%if new.month==6%}{%assign month="June"%}{%endif%}
{%if new.month==7%}{%assign month="July"%}{%endif%}
{%if new.month==8%}{%assign month="August"%}{%endif%}
{%if new.month==9%}{%assign month="September"%}{%endif%}
{%if new.month==10%}{%assign month="October"%}{%endif%}
{%if new.month==11%}{%assign month="November"%}{%endif%}
{%if new.month==12%}{%assign month="December"%}{%endif%}

{%if new.year==y%}
<div class="row">
<column style="float:left; width:180px; text-align:right; padding-right:20px"><p><b>({{month}}, {{new.day}})</b></p></column>
<column style="float:left; width:600px; text-align:justify"><p>{{ new.details }}</p></column>
</div>
    
{%endif%}

{% endfor %}
</div>
{% endfor %}
