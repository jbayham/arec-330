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
      <th style="width: 20%;">Lab</th>
      <th style="width: 10%;">Due</th>
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
      <td>{{ item.topic }}</td>
      <td>{{ item.lab }}</td>
      <td>{{ item.due }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>
