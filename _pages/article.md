---
permalink: /article/
layout: default
regenerate: true
title: "Volunteering Data Updates"
---

<p>Articles in this section relate to volunteering data standardisation.</p>

{% assign categories = "" | split: "" %}
{% for post in site.posts %}
  {% for cat in post.categories %}
    {% unless categories contains cat %}
      {% assign categories = categories | push: cat %}
    {% endunless %}
  {% endfor %}
{% endfor %}

{% unless categories.size == 0 %}{% assign sorted_categories = categories | sort %}<nav class="category-filter">
<a class="category" href="/article/">All</a>{% for cat in sorted_categories %}<a class="category" href="/article/?category={{ cat | url_encode }}">{{ cat }}</a>{% endfor %}
</nav>{% endunless %}

{% if site.posts.size > 0 %}
<ul class="article-list">
{% for post in site.posts %}
  <li data-categories="{{ post.categories | join: ',' }}">
    <h2 class="heading"><a href="{{ post.url }}">{{ post.title }}</a></h2>
    <span>{{ post.date | date: "%Y-%m-%d" }}</span>
    {% if post.categories.size > 0 %}
      <span>{% for cat in post.categories %}<a class="category" href="/article/?category={{ cat | url_encode }}">{{ cat }}</a>{% unless forloop.last %} {% endunless %}{% endfor %}</span>
    {% endif %}
  </li>
{% endfor %}
</ul>
{% endif %}

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const params = new URLSearchParams(window.location.search);
    const category = params.get('category');
    if (category) {
      document.querySelectorAll('.article-list li').forEach(function (li) {
        const cats = li.getAttribute('data-categories').split(',');
        li.style.display = cats.includes(category) ? '' : 'none';
      });
    }
  });
</script>
