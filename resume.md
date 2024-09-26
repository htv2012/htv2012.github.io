---
layout: page
title: Resume
permalink: /resume/
---

# My Resume

- 2024-09-19 [SoFi](/resume/sofi.md)
- 2024-09-19 [Snowflake - Iceberg](/resume/snowflake.md)

# Resume

{% for res in site.resume %}
- [{{ res.title }}]({{res.url}})
{% endfor %}

