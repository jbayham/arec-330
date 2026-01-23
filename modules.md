---
layout: page
title: Modules
permalink: /modules/
---

<!--<style>  small vertical gap + subtle separator between module action lines 
ul#archive li .module-line { display: block; margin: 0.05em 0 0.0em 0; padding: 0; } 
ul#archive li .module-line a { font-weight: bold; color: #0077CC; text-decoration: inherit; } 
ul#archive li .module-line a:hover { color: inherit; text-decoration: underline; }
</style>-->

<!-- <ul id="archive">


{% for gallery in site.data.modules %}
  {% if modules.id == page.galleryid %}
    <h1>{{ modules.description }}</h1>
    {% for image in sortedimages %}
      <li class="archiveposturl">
        <span><a href="{{ site.url }}/graphs/{{ image.file }}">{{image.title }}</a></span><br>
<span class = "postlower">{{ image.caption }}<br />
<strong>Tags:</strong> {{ image.tags }}</span>
      </li>
    {% endfor %}
  {% endif %}
{% endfor %}

</ul> -->

This page contains links to the lectures and materials organized into modules. 
Modules typically correspond to a week of the course, but may span multiple weeks or be shorter than a week.

<!--
Clicking the title of the week's lecture will go to a PDF, embedded in the user's browser, by default. 
The bottom right icons link to the Github directory for the lecture (<i class="fab fa-github"></i>), the R Markdown document for the lecture (<i class="fab fa-r-project"></i>), and a PDF, embedded on Github, for the lecture (<i class="fas fa-file-pdf"></i>).
-->

<ul id="archive">
{% for modules in site.data.modules %}
      <li class="archiveposturl">
<h3 class="module-title">{{ modules.title }}</h3>
<span class = "postlower"> {{ modules.desc }} </span>
<!--
<strong style="font-size:100%; font-family: 'Titillium Web', sans-serif; float:right; padding-right: .5em">
<a href="https://github.com/{{ site.githubdir}}/tree/master/{{ modules.dirname }}"><i class="fab fa-github"></i></a>&nbsp;&nbsp;
<a href="https://github.com/{{ site.githubdir}}/tree/master/{{ modules.dirname }}/{{ modules.filename}}.Rmd"><i class="fab fa-r-project"></i></a>&nbsp;&nbsp;
<a href="https://github.com/{{ site.githubdir}}/blob/master/{{ modules.dirname }}/{{ modules.filename}}.pdf"><i class="fas fa-file-pdf"></i></a>
</strong> 
-->

{% if modules.readings %}
  <br><strong>📖 Readings:</strong>
  <ul>
    {% for r in modules.readings %}
      <li><a href="{{ site.url }}{{ site.baseurl }}/{{ r.url }}">{{ r.title }}</a></li>
    {% endfor %}
  </ul>
{% endif %}


{% if modules.slides %}
  <br><strong><a href="{{ site.url }}{{ site.baseurl }}/{{ modules.dirname }}/{{ modules.slides }}">🖥 Slides</a></strong>
{% endif %}

{% if modules.lab %}
  <br><strong><a href="{{ site.url }}{{ site.baseurl }}/{{ modules.dirname }}/{{ modules.lab }}">💻 Lab</a></strong>
{% endif %}

{% if modules.assignment %}
  <br><strong><a href="{{ site.url }}{{ site.baseurl }}/{{ modules.dirname }}/{{ modules.assignment }}">📝 Lab Assignment</a></strong>
{% endif %}




{% if modules.materials %}
  <strong>Additional Materials:</strong>
  <ul>
    {% for c in modules.materials %}
      <li><a href="{{ site.url }}{{ site.baseurl }}/{{ modules.dirname }}/{{ c.url }}">{{ c.title }}</a></li>
    {% endfor %}
  </ul>
{% endif %}

<br>
      </li>
{% endfor %}
</ul>
