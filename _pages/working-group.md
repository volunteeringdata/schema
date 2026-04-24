---
permalink: /working-group
layout: default
title: Volunteering Data Standards Working Group
---

## Help develop open standards for volunteering data.

The Volunteering Data Standards Working Group is a community of subject matter experts, including: volunteering specialists, software providers, and data experts who collaborate to agree open standards for volunteering data.

The group is open to all and will provide the real-world context and technical advice necessary to ensure the data standards and infrastructure we develop are robust, practical, and directly meet the needs of the volunteering community.

The groups [Terms of Reference](/working-group/terms-of-reference) provide an overview of the Working Group and provide information on the management of intellectual property.


## What commitment am I making?

Membership of the group is voluntary and we recognise the amount of time people can contribute will vary, we therefore ask that you contribute what you can, when you can.

We will host monthly working group meetings which will be hosted online, using Google Meet.

Our meetings will normally use digital whiteboards (miro.com) to capture ideas and feedback. These boards will remain open for comment for 1 month to allow people who were unable to attend to see what was discussed and add their thoughts and ideas. 

We will also host [online discussion groups](https://github.com/orgs/volunteeringdata/discussions/) to enable you to contribute in your own time.


## How to Join the Standards Working Group?

Please sign-up using our registration form: [https://share.hsforms.com/17sQpFOMLTvK\_7SpLL6dn8gg1jy](https://share.hsforms.com/17sQpFOMLTvK_7SpLL6dn8gg1jy).

We will then ensure you are invited to working group meetings and receive working group communications and consultations.

If you have any questions please contact us via research@theodi.org


## Next Meetings

Currently there are no planned meetings.


## Previous Meetings

<ul>
{% assign wg_posts = site.posts | where_exp: "post", "post.categories contains 'Working Group'" %}
{% for post in wg_posts %}
    <li>{{ post.date | date: "%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
