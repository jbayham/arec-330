---
layout: page
title: "Course Schedule"
permalink: /schedule/
---

<table>
  <thead>
    <tr>
      <th style="width: 5%;">Week</th>
      <th style="width: 7%;">Date</th>
      <th style="width: 30%;">Topic</th>
      <th style="width: 30%;">Lab</th>
    </tr>
  </thead>
  <tbody>
    {% for item in site.data.schedule %}
    {% assign topic_lower = item.topic | downcase %}
    {% if topic_lower contains "exam" %}
      <tr class="exam-row">
    {% elsif topic_lower contains "no class" %}
      <tr class="noclass-row">
    {% else %}
      <tr>
    {% endif %}
      <td>{{ item.week }}</td>
      <td>{{ item.date | date: "%b %d" }}</td>
      {% assign module_anchor = item.module_id | default: "" %}
      <td>
        {% if module_anchor != "" %}
        <a href="{{ site.url }}{{ site.baseurl }}/modules/#{{ module_anchor }}">{{ item.topic }}</a>
        {% else %}
        <a href="{{ site.url }}{{ site.baseurl }}/modules">{{ item.topic }}</a>
        {% endif %}
      </td>
      <td>{{ item.lab }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>
