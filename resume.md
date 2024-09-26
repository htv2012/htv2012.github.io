---
layout: page
title: Resume
permalink: /resume/
---

# Resume

{% for res in site.resume %}
- [{{ res.title }}]({{res.url}})
{% endfor %}

