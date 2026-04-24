---
permalink: /publishing-opportunities-data
layout: default
title: Publishing Opportunities Data
---

<nav id="toc" class="toc">
<h2 id="table-of-contents">Table of Contents</h2>
<ol>
  <li><a href="#multiple-organisations"><span class="secno">1. </span><span class="content">Sharing multiple organisations opportunities</span></a></li>
  <li><a href="#single-organisation"><span class="secno">2. </span><span class="content">Sharing one organisation's opportunities</span></a></li>
  <li><a href="#metadata-publishing"><span class="secno">3. </span><span class="content">Sharing opportunities with metadata</span></a></li>
</ol>
</nav>

<h2 id="multiple-organisations">Sharing multiple organisations opportunities</h2>

<p>Volunteering opportunities can be shared as a list of organisations, each containing their activities with full details. This is the recommended structure for publishing opportunity data using the standard.</p>

<p>The top-level document is a JSON-LD array of <a href="/ontology/#organisation">Organisation</a> objects. Each organisation embeds its <a href="/ontology/#activity">activities</a>, which in turn embed their <a href="/ontology/#role">roles</a> and <a href="/ontology/#session">sessions</a> (with <a href="/ontology/#location">location</a> and <a href="/ontology/#time">time</a> details).</p>

<div class="example">
  <h5 id="example-1">Example 1</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "graph": [
    {
      "type": "Organisation",
      "id": "https://id.volunteeringdata.io/684059665d271835a2253c9d",
      "name": "Under One Sky",
      "description": "Under One Sky supports people experiencing homelessness through outreach, community meals, and practical assistance.",
      "website": "https://underoneskytogether.com/",
      "cause": [
          "https://ns.volunteeringdata.io/AntiPoverty"
      ],
      "activity": [
          {
          "id": "https://id.volunteeringdata.io/686e542f7734eb69b0ec1516",
          "title": "Volunteer Skywalker",
          "description": "Help distribute food, drink, and much-needed essential supplies to those who don't have a safe place to call home.",
          "role": [
              {
              "title": "Outreach Volunteer",
              "description": "Walk set routes to engage with people sleeping rough, offering food, warm clothing, and signposting to support services.",
              "commitment": "One evening per week, 3-hour shift",
              "applyLink": "https://underoneskytogether.com/get-involved/join-us",
              "allowsRemoteParticipation": false,
              "minimumAge": "18",
              "requirement": [
                  "https://ns.volunteeringdata.io/DBSCheck"
              ],
              "reward": [
                  "https://ns.volunteeringdata.io/TrainingProvided",
                  "https://ns.volunteeringdata.io/ExpensesReimbursed"
              ],
              "skill": [
                  "https://ns.volunteeringdata.io/Communication",
                  "https://ns.volunteeringdata.io/EmpathyAndCompassion"
              ]
              }
          ],
          "session": [
              {
              "location": {
                  "name": "Under One Sky Hub",
                  "address": "127-128 Lower Marsh, London SE1 7AE, UK",
                  "latitude": "51.5005014",
                  "longitude": "-0.1136474"
              },
              "time": [
                  "https://ns.volunteeringdata.io/MondayAfternoon",
                  "https://ns.volunteeringdata.io/TuesdayAfternoon",
                  "https://ns.volunteeringdata.io/SaturdayMorning",
                  "https://ns.volunteeringdata.io/SaturdayAfternoon"
                ]
              }
            ]
          }
        ]
      },
      {
        "type": "Organisation",
        "id": "https://id.volunteeringdata.io/64103c352a0eedb6aef42d3d",
        "name": "Oxfam GB",
        "description": "Oxfam is a global movement of people working together to end the injustice of poverty.",
        "website": "https://www.oxfam.org.uk/",
        "charityNumber": "202918",
        "image": "https://example.org/images/oxfam-logo.png",
        "cause": [
            "https://ns.volunteeringdata.io/AntiPoverty",
            "https://ns.volunteeringdata.io/CivilRights"
        ],
        "activity": [
          {
            "title": "Shop Volunteer",
            "description": "Help sort donations, serve customers, and keep the shop looking great. No experience needed.",
            "role": [
                {
                "title": "Shop Floor Volunteer",
                "description": "Sort and price donated items, assist customers, and help maintain the shop floor.",
                "commitment": "Half a day per week",
                "applyLink": "https://www.oxfam.org.uk/get-involved/volunteer-with-us/volunteer-in-our-shops/",
                "allowsRemoteParticipation": false,
                "minimumAge": "14",
                "reward": [
                    "https://ns.volunteeringdata.io/TrainingProvided"
                ],
                "skill": [
                    "https://ns.volunteeringdata.io/CustomerService",
                    "https://ns.volunteeringdata.io/Teamwork"
                ]
              }
            ],
            "session": [
              {
              "location": {
                  "name": "Oxfam Shop Headingley",
                  "address": "3 North Lane, Headingley, Leeds LS6 3HG, UK",
                  "latitude": "53.8218",
                  "longitude": "-1.5811"
              },
              "time": [
                  "https://ns.volunteeringdata.io/MondayMorning",
                  "https://ns.volunteeringdata.io/MondayAfternoon",
                  "https://ns.volunteeringdata.io/TuesdayMorning",
                  "https://ns.volunteeringdata.io/TuesdayAfternoon",
                  "https://ns.volunteeringdata.io/WednesdayMorning",
                  "https://ns.volunteeringdata.io/WednesdayAfternoon",
                  "https://ns.volunteeringdata.io/ThursdayMorning",
                  "https://ns.volunteeringdata.io/ThursdayAfternoon",
                  "https://ns.volunteeringdata.io/FridayMorning",
                  "https://ns.volunteeringdata.io/FridayAfternoon",
                  "https://ns.volunteeringdata.io/SaturdayMorning",
                  "https://ns.volunteeringdata.io/SaturdayAfternoon"
              ]
            }
          ]
        }
      ]
    }
  ]
}
{% endhighlight %}
</div>

<div class="note">
  <h5 id="note-1">Note 1</h5>
  <p>The <code>graph</code> property (mapped to <a href="https://www.w3.org/TR/json-ld11/#named-graphs">@graph</a> in JSON-LD) is used to group multiple top-level objects under a single shared <code>@context</code>. This avoids repeating the context in every organisation object. Each item in the <code>graph</code> array is an independent node in the linked data graph.</p>
</div>


<h2 id="single-organisation">Sharing one organisation's opportunities</h2>

<p>A single organisation can publish its own opportunities as one object with multiple activities.</p>

<div class="example">
  <h5 id="example-2">Example 2</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "type": "Organisation",
  "id": "https://id.volunteeringdata.io/64103c352a0eedb6aef42d3d",
  "name": "Oxfam GB",
  "description": "Oxfam is a global movement of people working together to end the injustice of poverty.",
  "website": "https://www.oxfam.org.uk/",
  "charityNumber": "202918",
  "cause": [
      "https://ns.volunteeringdata.io/AntiPoverty",
      "https://ns.volunteeringdata.io/CivilRights"
  ],
  "activity": [
      {
      "title": "Shop Volunteer",
      "description": "Help sort donations, serve customers, and keep the shop looking great. No experience needed.",
      "role": [
          {
          "title": "Shop Floor Volunteer",
          "description": "Sort and price donated items, assist customers, and help maintain the shop floor.",
          "commitment": "Half a day per week",
          "applyLink": "https://www.oxfam.org.uk/get-involved/volunteer-with-us/volunteer-in-our-shops/",
          "allowsRemoteParticipation": false,
          "minimumAge": "14",
          "reward": [
              "https://ns.volunteeringdata.io/TrainingProvided"
          ],
          "skill": [
              "https://ns.volunteeringdata.io/CustomerService",
              "https://ns.volunteeringdata.io/Teamwork"
          ]
          }
      ],
      "session": [
          {
          "location": {
              "name": "Oxfam Shop Headingley",
              "address": "3 North Lane, Headingley, Leeds LS6 3HG, UK",
              "latitude": "53.8218",
              "longitude": "-1.5811"
          },
          "time": [
              "https://ns.volunteeringdata.io/MondayMorning",
              "https://ns.volunteeringdata.io/MondayAfternoon",
              "https://ns.volunteeringdata.io/TuesdayMorning",
              "https://ns.volunteeringdata.io/TuesdayAfternoon",
              "https://ns.volunteeringdata.io/WednesdayMorning",
              "https://ns.volunteeringdata.io/WednesdayAfternoon",
              "https://ns.volunteeringdata.io/ThursdayMorning",
              "https://ns.volunteeringdata.io/ThursdayAfternoon",
              "https://ns.volunteeringdata.io/FridayMorning",
              "https://ns.volunteeringdata.io/FridayAfternoon",
              "https://ns.volunteeringdata.io/SaturdayMorning",
              "https://ns.volunteeringdata.io/SaturdayAfternoon"
          ]
          }
      ]
      },
      {
      "title": "Online Shop Volunteer",
      "description": "Help list and sell donated items online. Photograph items, write descriptions, and manage listings from home or in-store.",
      "role": [
          {
          "title": "Online Listings Volunteer",
          "description": "Photograph donated items, write compelling descriptions, and list them for sale on Oxfam's online shop.",
          "commitment": "Half a day per week",
          "applyLink": "https://www.oxfam.org.uk/get-involved/volunteer-with-us/volunteer-in-our-shops/",
          "allowsRemoteParticipation": true,
          "minimumAge": "16",
          "reward": [
              "https://ns.volunteeringdata.io/TrainingProvided"
          ],
          "skill": [
              "https://ns.volunteeringdata.io/Photography",
              "https://ns.volunteeringdata.io/Writing"
          ]
          }
      ],
      "session": [
          {
          "location": {
              "name": "Oxfam Shop Headingley",
              "address": "3 North Lane, Headingley, Leeds LS6 3HG, UK",
              "latitude": "53.8218",
              "longitude": "-1.5811"
          },
          "time": [
              "https://ns.volunteeringdata.io/MondayMorning",
              "https://ns.volunteeringdata.io/MondayAfternoon",
              "https://ns.volunteeringdata.io/WednesdayMorning",
              "https://ns.volunteeringdata.io/WednesdayAfternoon",
              "https://ns.volunteeringdata.io/FridayMorning",
              "https://ns.volunteeringdata.io/FridayAfternoon"
          ]
          }
      ]
      }
  ]
}
{% endhighlight %}
</div>


<h2 id="metadata-publishing">Sharing opportunities with metadata</h2>

<p>Volunteering opportunities can be shared with additional information about the data itself: license, publisher, conformance and last modified date.</p>

<div class="example">
  <h5 id="example-3">Example 3</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "conformsTo": "https://ns.volunteeringdata.io/",
  "license": "CC-BY-NC-SA-4.0",
  "publisher": "https://scvo.scot/",
  "modified": "2026-03-23",
  "graph": [
    {
      "type": "Organisation",
      "id": "https://id.volunteeringdata.io/684059665d271835a2253c9d",
      "name": "Under One Sky",
      ...
    }
  ]
}
{% endhighlight %}
</div>

<div class="note">
  <h5>Note</h5>
  <p>The <code>license</code> property value <code>"CC-BY-NC-SA-4.0"</code> is an <a href="https://spdx.org/licenses/">SPDX license identifier</a>.</p>
  <p>SPDX (System Package Data Exchange) provides a standardised list of license identifiers that can be used to communicate licensing information in a concise and unambiguous way.</p>
</div>

<div class="note">
  <h5>Note</h5>
  <p>Additional metadata information could be added to describe the data. For example, <a href="https://www.w3.org/TR/vocab-dcat-3/#examples-data-service">data services can be described using DCAT</a>.</p>
  <p>Other specifications can be used to describe data such as <a href="https://ekgf.github.io/dprod/#data-product-dprod-model">DPROD</a> that extends DCAT and focuses on data services or <a href="https://docs.mlcommons.org/croissant/docs/croissant-spec-1.1.html">Croissant</a> that focuses on metadata for machine learning readiness.</p>
</div>
