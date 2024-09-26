---
layout: page
title: Resume
permalink: /resume/
---

{% for res in site.resume %}
- [{{ res.title }}]({{res.url}})
{% endfor %}

